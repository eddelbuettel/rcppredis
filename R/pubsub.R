# Callback handler for convenience
redisMonitorChannels <- function(context, type=c("rdata", "raw", "string")) {
    type <- match.arg(type)
    x <- context$listen(type)
    if (length(x) != 3 || x[[1]] != "message") return(x)
    if (exists(x[[2]], mode="function")) {
        return(do.call(x[[2]],as.list(x[[3]])))
    }
    x
}
