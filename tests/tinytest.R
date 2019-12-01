
if (requireNamespace("tinytest", quietly=TRUE) &&
    utils::packageVersion("tinytest") >= "1.0.0") {

    ## Set a seed to make the test deterministic
    set.seed(42)

    ## R makes us to this
    Sys.setenv("R_TESTS"="")


    ## RcppRedis tests require a Redis server
    ## we cannot always assume one, so default to FALSE
    runTests <- FALSE

    ## if we know a redis server is set up, we can signal this -- cf .travis.yml
    if (Sys.getenv("RunRcppRedisTests") == "yes") runTests <- TRUE

    ## here is a shortcut: if the user is 'edd' we also run tests
    ## ought to be wrong on CRAN, win-builder, ...
    if (Sys.getenv("USER") == "edd") runTests <- TRUE

    if (runTests) {
        ## there are several more granular ways to test files in a tinytest directory,
        ## see its package vignette; tests can also run once the package is installed
        ## using the same command `test_package(pkgName)`, or by director or file
        tinytest::test_package("RcppRedis", ncpu=getOption("Ncpus", 1))
    }
}
