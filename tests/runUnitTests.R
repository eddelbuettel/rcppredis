# Copyright (C) 2010 - 2013  Dirk Eddelbuettel, Romain Francois and Douglas Bates
# Copyright (C) 2014 - 2018  Dirk Eddelbuettel
# Earlier copyrights Gregor Gorjanc, Martin Maechler and Murray Stokely as detailed below
#
# This file is part of RcppRedis.
#
# RcppRedis is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 2 of the
# License, or (at your option) any later version.
#
# RcppRedis is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with RcppRedis.  If not, see <http://www.gnu.org/licenses/>.

## doRUnit.R --- Run RUnit tests
##
## with credits to package fUtilities in RMetrics
## which credits Gregor Gojanc's example in CRAN package  'gdata'
## as per the R Wiki http://wiki.r-project.org/rwiki/doku.php?id=developers:runit
## and changed further by Martin Maechler
## and more changes by Murray Stokely in HistogramTools
##
## Dirk Eddelbuettel, Jan - April 2014

if (requireNamespace("RUnit", quietly=TRUE) &&
    requireNamespace("rredis", quietly=TRUE) &&
    requireNamespace("RcppRedis", quietly=TRUE)) {

    library(RUnit)
    library(rredis)                     # used for comparisons
    library(RcppRedis)

    ## Set a seed to make the test deterministic
    set.seed(42)

    ## Define tests
    testSuite <- defineTestSuite(name="RcppRedis Unit Tests",
                                 dirs=system.file("tests", package="RcppRedis"),
                                 testFuncRegexp = "^[Tt]est+")

    ## RcppRedis tests require a Redis server
    ## we cannot always assume one, so default to FALSE
    runTests <- FALSE

    ## if we know a redis server is set up, we can signal this -- cf .travis.yml
    if (Sys.getenv("RunRcppRedisTests") == "yes") runTests <- TRUE

    ## here is a shortcut: if the user is 'edd' we also run tests
    ## ought to be wrong on CRAN, win-builder, ...
    if (Sys.getenv("USER") == "edd") runTests <- TRUE

    ## Tests for test run
    if (runTests) {
        tests <- runTestSuite(testSuite)    # run tests
        printTextProtocol(tests)	    # print results

        ## Return success or failure to R CMD CHECK
        if (getErrors(tests)$nFail > 0) stop("TEST FAILED!")
        if (getErrors(tests)$nErr > 0) stop("TEST HAD ERRORS!")
        if (getErrors(tests)$nTestFunc < 1) stop("NO TEST FUNCTIONS RUN!")
    }
}
