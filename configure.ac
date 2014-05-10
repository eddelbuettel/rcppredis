## -*- mode: autoconf; autoconf-indentation: 4; -*-
##
##  RcppRedis configure.ac
##
##  RcppRedis -- R interface to Redis via Rcpp and hiredis
##
##  Copyright (C) 2014  Dirk Eddelbuettel 
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
AC_INIT([RcppRedis], [0.1.0])

# We are using C++
AC_LANG(C++)
AC_REQUIRE_CPP
AC_PROG_CXX

## check for pkg-config
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
    else
        hiredis_cxxflags=""
        hiredis_libs="-lhiredis"
    fi
else
    ## Add a reasonable default of -lhiredis if we don't have pkg-config
    hiredis_cxxflags=""
    hiredis_libs="-lhiredis"
fi

## And make sure these flags are used for the tests below.
CPPFLAGS="${hiredis_cxxflags} ${CPPFLAGS}"
CXXFLAGS="${hiredis_cxxflags} ${CXXFLAGS}"


## check for headers Debian has in libhiredis-dev
hiredis_header=hiredis/hiredis.h
hiredis_header_cache_var=AS_TR_SH([ac_cv_header_$hiredis_header])
AC_CHECK_HEADER([$hiredis_header],,
                [       
		# If it didn't work, try adding /usr/local directly then trying again
		AC_MSG_WARN([Hiredis headers not found with via default CXXFLAGS and CPPFLAGS, trying /usr/local/include])
		CPPFLAGS="${hiredis_cxxflags} ${CPPFLAGS} -I/usr/local/include"
		CXXFLAGS="${hiredis_cxxflags} ${CXXFLAGS} -I/usr/local/include -L/usr/local/lib"
		# unset the cache variable for this particular header check
		# so we can check again with different defaults specified.
		AC_MSG_WARN([Unsetting $hiredis_header_cache_var])
		AS_UNSET([$hiredis_header_cache_var])
		AC_CHECK_HEADER([$hiredis_header],,
		[AC_MSG_ERROR([ERROR: hiredis headers required; use '-Iincludedir' in CXXFLAGS for unusual locations.])])
		])

## could check for minimal suitable version here

## now use all these
AC_SUBST([PKG_CXXFLAGS],["${PKG_CXXFLAGS} $hiredis_cxxflags"])
AC_SUBST([PKG_LIBS],["${PKG_LIBS} $hiredis_libs"])
AC_SUBST([R_HOME],["${R_HOME}"])
AC_CONFIG_FILES([src/Makevars])
AC_OUTPUT
echo "Completed configuration and ready to build."

