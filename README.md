## RcppRedis: RcppRedis is a Rcpp and hiredis-based Redis client for R

[![CI](https://github.com/eddelbuettel/rcppredis/workflows/ci/badge.svg)](https://github.com/eddelbuettel/rcppredis/actions?query=workflow%3Aci)
[![License](https://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](https://www.gnu.org/licenses/gpl-2.0.html)
[![CRAN](https://www.r-pkg.org/badges/version/RcppRedis)](https://cran.r-project.org/package=RcppRedis)
[![r-universe](https://eddelbuettel.r-universe.dev/badges/RcppRedis)](https://eddelbuettel.r-universe.dev/RcppRedis)
[![Dependencies](https://tinyverse.netlify.app/badge/RcppRedis)](https://cran.r-project.org/package=RcppRedis)
[![Downloads](https://cranlogs.r-pkg.org/badges/RcppRedis?color=brightgreen)](https://www.r-pkg.org:443/pkg/RcppRedis)
[![Last Commit](https://img.shields.io/github/last-commit/eddelbuettel/rcppredis)](https://github.com/eddelbuettel/rcppredis)

### Dependencies

The package has three dependencies that should be easily resolvable:

- [hiredis](https://github.com/redis/hiredis), the main C library for Redis, eg via
  [libhiredis-dev](https://packages.debian.org/sid/libhiredis-dev) on Debian or Ubuntu; as
  a fallback [hiredis](https://github.com/redis/hiredis) is also included
- [Rcpp](https://github.com/RcppCore/Rcpp) for seamless R and C++ integration (on
  [CRAN](https://cran.r-project.org/package=Rcpp))
- [RApiSerialize](https://github.com/eddelbuettel/rapiserialize) for C-level serialization
  from the R API (on [CRAN](https://cran.r-project.org/package=RApiSerialize)) , and if
  so, of sufficient vintage80

The package should install from source like any other R package. If the a
[hiredis](https://github.com/redis/hiredis) library is found, it will be used. The
`pkg-config` script is used to find the hiredis headers and library. Otherwise the
embedded [hiredis](https://github.com/redis/hiredis) is used.  All of Rcpp, RApiSerialized
and RcppRedis can be installed directly from [CRAN](https://cran.r-project.org) (which is
the recommended approach) or GitHub.

[MessagePack](http://msgpack.org/index.html) support is optional, and provided by
[RcppMsgPack](https://github.com/eddelbuettel/rcppmsgpack) package on
[CRAN](https://cran.r-project.org/package=RcppMsgPack) which, if installed, is used to
provide [MessagePack](http://msgpack.org/index.html) headers for
[MessagePack](http://msgpack.org/index.html) serialization.


### Getting Started

Run some of the scripts from the `demo/` directory.

### Status

The package works well, is used in production, and has been on
[CRAN](https://cran.r-project.org) for some time.

It is however only providing a subset of the Redis API.

### History

This package was derived from an initial fork of an earlier attempt named
'rhiredis' by Wush Wu, and has since been extended in a number of
ways. William Pleasant provided some early patches. Whit Armstrong and
Russell Pierce contributed extensions.

### Authors

Dirk Eddelbuettel and Bryan W. Lewis, based on earlier work by Wush Wu and
with contributions by William Pleasant, Russell Pierce and Whit Armstrong.

### License

GPL (>= 2)
