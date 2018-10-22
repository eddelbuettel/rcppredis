# Hiredis Makefile
# Copyright (C) 2010-2011 Salvatore Sanfilippo <antirez at gmail dot com>
# Copyright (C) 2010-2011 Pieter Noordhuis <pcnoordhuis at gmail dot com>
# This file is released under the BSD license, see the COPYING file

# Shortened for RcppRedis as we need just libhiredis.a here if no hiredis found

OBJ=net.o hiredis.o sds.o async.o read.o dict.o
LIBNAME=libhiredis
STLIBSUFFIX=a
STLIBNAME=$(LIBNAME).$(STLIBSUFFIX)
STLIB_MAKE_CMD=$(AR) rcs $(STLIBNAME)

all: $(STLIBNAME) 

# Deps (use make dep to generate this)
net.o: net.c fmacros.h net.h hiredis.h read.h sds.h
hiredis.o: hiredis.c fmacros.h hiredis.h read.h sds.h net.h
sds.o: sds.c sds.h
async.o: async.c fmacros.h async.h hiredis.h read.h sds.h net.h dict.c dict.h
read.o: read.c fmacros.h read.h sds.h
dict.o: dict.c fmacros.h dict.h

$(STLIBNAME): $(OBJ)
	$(STLIB_MAKE_CMD) $(OBJ)

