# helper function
listen <- function(context) {
    stopifnot(`context must be a valid Redis context` = inherits(context, "Rcpp_Redis"))
    ans <- context$getReply()
    if (length(ans) != 3) {
        warning("invalid subscription response, raw data returned")
        return(ans)
    }
    ans[[1]] <- rawToChar(ans[[1]])
    ans[[2]] <- rawToChar(ans[[2]])
    ans[[3]] <- tryCatch(unserialize(ans[[3]]), error=function(e) rawToChar(ans[[3]]))
    ans
}


# Callback handler for convenience
redisMonitorChannels <- function(context) {
    x <- listen(context)
    if (length(x) != 3 || x[[1]] != "message") return(x)
    if (exists(x[[2]], mode="function")) {
        return(do.call(x[[2]],as.list(x[[3]])))
    }
    x
}
