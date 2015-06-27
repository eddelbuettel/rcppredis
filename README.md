## RcppRedis [![Build Status](https://travis-ci.org/eddelbuettel/rcppredis.png)](https://travis-ci.org/eddelbuettel/rcppredis) [![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html)

RcppRedis is a Rcpp and hiredis based Redis client for R 

### Dependencies

- [hiredis](https://github.com/redis/hiredis), the main C library for Redis, eg via [libhiredis-dev](https://packages.debian.org/sid/libhiredis-dev) on Debian or Ubuntu
- [Rcpp](https://github.com/RcppCore/Rcpp) for seamless R and C++ integration
- [RApiSerialize](https://github.com/eddelbuettel/rapiserialize) for C-level serialization from the R API

The package should install from source like any other R package provided the
dependency on the [hiredis](https://github.com/redis/hiredis) library is
met. The `pkg-config` script is used to find the hiredis headers and
library. All of Rcpp, RApiSerialized and RcppRedis can be installed directly
from CRAN (which is the recommended approach) or GitHub.

On OS X, the header file `hiredis.h` has been seen to be installed directly
in `/usr/local/include` whereas we generally assume a location within a
`hiredis` directory, eg `/usr/local/include/hiredis/hiredis.h`. This
[gist](https://gist.github.com/romainfrancois/e70e6c49fdda9172b644) shows a
successfull OS X installation via homebrew.

### Getting Started

Run some of the scripts from the `demo/` directory.

### Status

The package works well and is used in production. It is however only providing
a subset of the Redis API.

### History

This package was derived from an initial fork of an earlier attempt named
'rhiredis' by Wush Wu, and has since been extended in a number of
ways. William Pleasant provided some early patches.

### Author

Dirk Eddelbuettel, based on earlier work by Wush Wu and with early
contributions by William Pleasant

### License

GPL (>= 2)

