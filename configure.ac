##
##  RcppRedis configure.ac
##
##  RcppRedis -- R interface to Redis via Rcpp and hiredis
##
##  Copyright (C) 2014 - 2020  Dirk Eddelbuettel
##
##  RcppRedis is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 2 of the License, or
##  (at your option) any later version.
##
##  RcppRedis is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with RcppRedis.  If not, see <http://www.gnu.org/licenses/>.

# require at least autoconf 2.61
AC_PREREQ(2.61)

# Process this file with autoconf to produce a configure script.
AC_INIT([RcppRedis], [0.1.10])

# Ensure C++ is set up as R expects
: ${R_HOME=`R RHOME`}
if test -z "${R_HOME}"; then
    AC_MSG_ERROR([Could not determine R_HOME.])   
fi
CXX=`"${R_HOME}/bin/R" CMD config CXX`
CXXFLAGS=`"${R_HOME}/bin/R" CMD config CXXFLAGS`
AC_LANG(C++)
AC_REQUIRE_CPP
AC_PROG_CXX

## default to building from embedded sources ... unless hiredis found
hiredis_libs=hiredis/libhiredis.a
hiredis_tgt=libhiredis.a
hiredis_cxxflags="-I."

## ... but check for pkg-config
AC_DEFUN([AC_PROG_PKGCONFIG], [AC_CHECK_PROG(PKGCONFIG,pkg-config,yes)])
AC_PROG_PKGCONFIG

## use pkg-config for hiredis
##
if test x"${PKGCONFIG}" == x"yes"; then
    ## check via pkg-config for hiredis
    if pkg-config --exists hiredis; then
        ## obtain cflags and obtain libs
        hiredis_cxxflags=`pkg-config --cflags hiredis`
        hiredis_libs=`pkg-config --libs hiredis`
        ## no need to build libhiredis.a
        hiredis_tgt=""     
    else
        AC_MSG_WARN([pkg-config exists but hiredis is not available.])
    fi
fi

## And make sure these flags are used for the tests below.
CPPFLAGS="${hiredis_cxxflags} ${CPPFLAGS}"
CXXFLAGS="${hiredis_cxxflags} ${CXXFLAGS}"

## check for headers Debian has in libhiredis-dev
hiredis_header=hiredis/hiredis.h
hiredis_header_cache_var=AS_TR_SH([ac_cv_header_$hiredis_header])
AC_CHECK_HEADER([$hiredis_header],,[       
    # If it didn't work, try adding /usr/local directly then trying again
    AC_MSG_WARN([Hiredis headers not found with via default CXXFLAGS and CPPFLAGS, trying /usr/local/include])
    CPPFLAGS="${hiredis_cxxflags} ${CPPFLAGS} -I/usr/local/include"
    CXXFLAGS="${hiredis_cxxflags} ${CXXFLAGS} -I/usr/local/include -L/usr/local/lib"
    # unset the cache variable for this particular header check
    # so we can check again with different defaults specified.
    AC_MSG_WARN([Unsetting $hiredis_header_cache_var])
    AS_UNSET([$hiredis_header_cache_var])
    AC_CHECK_HEADER([$hiredis_header],,
    [AC_MSG_WARN([hiredis headers not found.])])
])

## could check for minimal suitable version here

## First, set R_HOME, respecting an environment variable if set (now above)
#: ${R_HOME=$(R RHOME)}
#if test -z "${R_HOME}"; then
#    AC_MSG_ERROR([Could not determine R_HOME.])   
#fi

## look for (optional !!) MsgPack headers
## RcppMsgPack on CRAN fits the bill -- but is a soft dependency
AC_MSG_CHECKING([for RcppMsgPack])
## Check if R has RcppMsgPack
$("${R_HOME}/bin/Rscript" --vanilla -e 'hasPkg <- "RcppMsgPack" %in% rownames(installed.packages()); q(save="no", status=if (hasPkg) packageVersion("RcppMsgPack") >= "0.2.0" else FALSE)')
if test x"$?" == x"1"; then
    AC_MSG_RESULT([yes])
    msgpackincdir=$("${R_HOME}/bin/Rscript" --vanilla -e 'cat(system.file("include", package="RcppMsgPack"))')
    msgpack_cxxflags="-I${msgpackincdir} -DHAVE_MSGPACK"
    AC_MSG_NOTICE([Found RcppMsgPack, using '${msgpack_cxxflags}'])
else
    AC_MSG_RESULT([no])
    AC_MSG_NOTICE([Install (optional) RcppMsgPack (>= 0.2.0) from CRAN via 'install.packages("RcppMsgPack")'])
fi    

## now use all these
AC_SUBST([PKG_CXXFLAGS],["${PKG_CXXFLAGS} $hiredis_cxxflags $msgpack_cxxflags"])
AC_SUBST([PKG_LIBS],["${PKG_LIBS} $hiredis_libs"])
AC_SUBST([PKG_TARGET], [" $hiredis_tgt"])
AC_CONFIG_FILES([src/Makevars])
AC_OUTPUT

echo "
${PACKAGE_NAME} ${PACKAGE_VERSION}
================

compiler flags: ${PKG_CXXFLAGS} 
link argument:  ${PKG_LIBS}
library target: ${PKG_TARGET}
"

