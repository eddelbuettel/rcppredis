## RcppRedis

RcppRedis is a simple Redis client for R which uses Rcpp and hiredis, a
minimalistic C client library for Redis.

## History

This package os derived from an initial fork of an earlier attempt named
'rhiredis' by Wush Wu, and has since been extended. William Pleasant provided
some early patches.

## Dependencies

- [hiredis](https://github.com/redis/hiredis) library (eg [libhiredis-dev](https://packages.debian.org/sid/libhiredis-dev) on Debian or Ubuntu)
- [Rcpp](https://github.com/RcppCore/Rcpp) for seamless R and C++ integration
- [RApiSerialize](https://github.com/eddelbuettel/rapiserialize) for C-level serialization from the R API

The package should install from source like any other R package provided the
dependency on the [hiredis](https://github.com/redis/hiredis) library is
met. `pkg-config` is used to find the hiredis headers and library. All of
Rcpp, RApiSerialized and RcppRedis can be installed from CRAN (which is
recommended) or GitHub.

On OS X, the header file `hiredis.h` has been seen to be installed directly
in `/usr/local/include` whereas we generally assume a location within a
`hiredis` directory, eg `/usr/local/include/hiredis/hiredis.h`. This
[gist](https://gist.github.com/romainfrancois/e70e6c49fdda9172b644) shows a
successfull OS X installation via homebrew.

## Getting Started

Run some of the scripts from the demo/ directory.

## Status

[![Build Status](https://travis-ci.org/eddelbuettel/rcppredis.png)](https://travis-ci.org/eddelbuettel/rcppredis)
