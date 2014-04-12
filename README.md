## RcppRedis

RcppRedis is a simple Redis client for R which uses Rcpp and hiredis, a
minimalistic C client library for Redis.

## History

This package os derived from an initial fork of an earlier attempt named
'rhiredis' by Wush Wu, and has since been extended. William Pleasant provided
some early patches.

## Dependencies

- hiredis library (eg libhiredis-dev on Debian or Ubuntu)
- Rcpp

The package should install from source like any other R package provided the
dependencies are met. `pkg-config` is used to find the hiredis headers and
library. 

## Getting Started

Run some of the scripts from the demo/ directory.

## Status

[![Build Status](https://travis-ci.org/eddelbuettel/rcppredis.png)](https://travis-ci.org/eddelbuettel/rcppredis)
