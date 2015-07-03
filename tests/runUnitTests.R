
## doRUnit.R --- Run RUnit tests
##
## with credits to package fUtilities in RMetrics
## which credits Gregor Gojanc's example in CRAN package  'gdata'
## as per the R Wiki http://wiki.r-project.org/rwiki/doku.php?id=developers:runit
## and changed further by Martin Maechler
## and more changes by Murray Stokely in HistogramTools
##
## Dirk Eddelbuettel, Jan - April 2014

stopifnot(require("RUnit", quietly=TRUE))
stopifnot(require("RcppRedis", quietly=TRUE))

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
    ## Run tests
    tests <- runTestSuite(testSuite)

    ## Print results
    printTextProtocol(tests)

    ## Return success or failure to R CMD CHECK
    if (getErrors(tests)$nFail > 0) {
        stop("TEST FAILED!")
    }
    if (getErrors(tests)$nErr > 0) {
        stop("TEST HAD ERRORS!")
    }
    if (getErrors(tests)$nTestFunc < 1) {
        stop("NO TEST FUNCTIONS RUN!")
    }
}
