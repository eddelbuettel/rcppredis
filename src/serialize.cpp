// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-

// serialize/unserialize from Rhpc package, which takes it from R-3.0.2
// but converted from binary serialization (as default) to ascii
// and coupled with charToRaw / rawToChar conversions to make it useful for Redis

/*
 *
 * From R-3.0.2 archive, src/main/serialize.c 
 *
 */
/*
 *  R : A Computer Language for Statistical Data Analysis
 *  Copyright (C) 1995--2013  The R Core Team
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, a copy is available at
 *  http://www.r-project.org/Licenses/
 */

#include <stdlib.h>
#include <string.h>
// does not seem to be needed #define USE_INTERNAL
#include <Rinternals.h>

static const int R_DefaultSerializeVersion = 2;


/*
 * Persistent Memory Streams
 */

typedef struct membuf_st {
    R_xlen_t size;
    R_xlen_t count;
    unsigned char *buf;
} *membuf_t;

#define MAXELTSIZE 8192
#define INCR MAXELTSIZE

static void resize_buffer(membuf_t mb, R_xlen_t needed) {
    unsigned char *tmp;
    if(needed > R_XLEN_T_MAX)
	error("serialization is too large to store in a raw vector");
    #ifdef LONG_VECTOR_SUPPORT
        if(needed < 10000000) /* ca 10MB */
            needed = (1+2*needed/INCR) * INCR;
        else 
            needed = (R_xlen_t)((1+1.2*(double)needed/INCR) * INCR);
    #else
        if(needed < 10000000) /* ca 10MB */
            needed = (1+2*needed/INCR) * INCR;
        else if(needed < 1700000000) /* close to 2GB/1.2 */
            needed = (R_xlen_t)((1+1.2*(double)needed/INCR) * INCR);
        else if(needed < INT_MAX - INCR)
            needed = (1+needed/INCR) * INCR;
    #endif
    tmp = (unsigned char*) realloc((void*) mb->buf, (size_t) needed);
    if (tmp == NULL) {
	free(mb->buf); mb->buf = NULL;
	error("cannot allocate buffer");
    } else mb->buf = tmp;
    mb->size = needed;
}

static void OutCharMem(R_outpstream_t stream, int c)
{
    membuf_t mb = (membuf_t) stream->data;
    if (mb->count >= mb->size)
	resize_buffer(mb, mb->count + 1);
    mb->buf[mb->count++] = (char) c;
}

static void OutBytesMem(R_outpstream_t stream, void *buf, int length)
{
    membuf_t mb = (membuf_t) stream->data;
    R_xlen_t needed = mb->count + (R_xlen_t) length;
    #ifndef LONG_VECTOR_SUPPORT
        /* There is a potential overflow here on 32-bit systems */
        if((double) mb->count + length > (double) INT_MAX)
            error("serialization is too large to store in a raw vector");
    #endif
    if (needed > mb->size) resize_buffer(mb, needed);
    memcpy(mb->buf + mb->count, buf, length);
    mb->count = needed;
}

static int InCharMem(R_inpstream_t stream)
{
    membuf_t mb = (membuf_t) stream->data;
    if (mb->count >= mb->size)
	error("read error");
    return mb->buf[mb->count++];
}

static void InBytesMem(R_inpstream_t stream, void *buf, int length)
{
    membuf_t mb = (membuf_t) stream->data;
    if (mb->count + (R_xlen_t) length > mb->size)
	error("read error");
    memcpy(buf, mb->buf + mb->count, length);
    mb->count += length;
}

static void InitMemInPStream(R_inpstream_t stream, membuf_t mb,
			     void *buf, R_xlen_t length,
			     SEXP (*phook)(SEXP, SEXP), SEXP pdata)
{
    mb->count = 0;
    mb->size = length;
    mb->buf = (unsigned char*) buf;
    R_InitInPStream(stream, (R_pstream_data_t) mb, R_pstream_any_format,
		    InCharMem, InBytesMem, phook, pdata);
}

static void InitMemOutPStream(R_outpstream_t stream, membuf_t mb,
			      R_pstream_format_t type, int version,
			      SEXP (*phook)(SEXP, SEXP), SEXP pdata)
{
    mb->count = 0;
    mb->size = 0;
    mb->buf = NULL;
    R_InitOutPStream(stream, (R_pstream_data_t) mb, type, version,
		     OutCharMem, OutBytesMem, phook, pdata);
}

static void free_mem_buffer(void *data)
{
    membuf_t mb = (membuf_t) data;
    if (mb->buf != NULL) {
	unsigned char *buf = mb->buf;
	mb->buf = NULL;
	free(buf);
    }
}

static SEXP CloseMemOutPStream(R_outpstream_t stream)
{
    SEXP val;
    membuf_t mb = (membuf_t) stream->data;

    PROTECT(val = allocVector(RAWSXP, mb->count));
    memcpy(RAW(val), mb->buf, mb->count);
    free_mem_buffer(mb);
    UNPROTECT(1);
    return val;
}

/** ---- **/

extern "C" SEXP serializeToChar(SEXP object)
{
    struct R_outpstream_st out;
    R_pstream_format_t type;
    int version;
    struct membuf_st mbs;
    SEXP val;
    
    version = R_DefaultSerializeVersion;
    //type = R_pstream_binary_format;
    type = R_pstream_ascii_format;
    

    /* set up a context which will free the buffer if there is an error */
    
    InitMemOutPStream(&out, &mbs, type, version, NULL, R_NilValue);
    R_Serialize(object, &out);
    
    val =  CloseMemOutPStream(&out);
    
    /* end the context after anything that could raise an error but before
       calling OutTerm so it doesn't get called twice */


    // borrowed from rawToChar
    SEXP ans;
    int i, j, nc = LENGTH(val);
    /* String is not necessarily 0-terminated and may contain nuls.
       Strip trailing nuls */
    for (i = 0, j = -1; i < nc; i++) if(RAW(val)[i]) j = i;
    nc = j + 1;
    PROTECT(ans = allocVector(STRSXP, 1));
    SET_STRING_ELT(ans, 0,
                   mkCharLenCE((const char *)RAW(val), j+1, CE_NATIVE));
    UNPROTECT(1);

    return ans;
}


extern "C" SEXP unserializeFromChar(SEXP object)
{
    // borrowed from charToRaw
    int nc = LENGTH(STRING_ELT(object, 0));
    SEXP ans = allocVector(RAWSXP, nc);
    memcpy(RAW(ans), CHAR(STRING_ELT(object, 0)), nc);


    struct R_inpstream_st in;

    /* We might want to read from a long raw vector */
    struct membuf_st mbs;

    if (TYPEOF(ans) == RAWSXP) {
        void *data = RAW(ans);
        R_xlen_t length = XLENGTH(ans);
        InitMemInPStream(&in, &mbs, data,  length, NULL, NULL);
        return R_Unserialize(&in);
    }
    error("can't unserialize object");
    return(R_UnboundValue);
}


