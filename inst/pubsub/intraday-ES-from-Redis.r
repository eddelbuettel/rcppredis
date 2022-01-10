
suppressMessages({
    library(quantmod)
    library(anytime)
    library(RcppRedis)
})

defaultTZ <- "America/Chicago"
symbol <- "ES=F"
host <- "localhost"
ndays <- 2

most_recent_n_days <- function(x, n=2, minobs=1500) {
    tt <- table(as.Date(index(x)))
    if (length(tt) < n) return(x)
    cutoff <- paste(format(as.Date(names(head(tail(tt[tt>minobs], n), 1)))), "00:00:00")
    newx <- x[ index(x) >= as.POSIXct(cutoff) ]
    msg(Sys.time(), "most recent data starting at", format(head(index(newx),1)))
    newx
}

get_all_data <- function(symbol, host) {
    m <- redis$zrange(symbol, 0, -1)
    colnames(m) <- c("Time", "Close", "Change", "PctChange", "Volume")
    y <- xts(m[,-1], order.by=anytime(as.numeric(m[,1])))
    y
}

show_plot <- function(symbol, x) {
    lastx <- tail(coredata(x),1)
    cname <- paste(symbol,
                   format(lastx[,"Close"]),
                   round(lastx[,"Change"], 2),
                   round(lastx[,"PctChange"], 5),
                   format(Sys.time(), "%H:%M:%S"),
                   sep = "   ")
    cs <- quantmod::chart_Series(x[,"Close"], name = cname)
    ## cf issue 270
    ##    chart_Series(IBM, name=NULL)
    ##    title('IBM', font.main=3, col.main="#ff0000", line=2.5)
    plot(cs)
}

msg <- function(ts, ...) {
    op <- options(digits.secs=3)
    cat(format(ts), ..., "\n")
    options(op)
}

redis <- new(Redis, host)
if (redis$ping() != "PONG") stop("No Redis server?", call. = FALSE)
x <- get_all_data(symbol, host)
x <- most_recent_n_days(x,ndays)
show_plot(symbol, x)

## This is the callback function assigned to a symbol
.data2xts <- function(x) {
    m <- read.csv(text=x, sep=";", header=FALSE, col.names = c("Time", "Close", "Change", "PctChange", "Volume"))
    y <- xts(m[,-1,drop=FALSE], anytime(as.numeric(m[,1,drop=FALSE])))
    y
}
assign(symbol, .data2xts)               # programmatic version of callback `ES=F` <- function(x) ....
redis$subscribe(symbol)

market_closed <- TRUE
repeat {
    curr_t <- Sys.time()
    now_t <- xts(, curr_t)
    now <- .indexhour(now_t)*100 + .indexmin(now_t)
    if (now >= 1525 && now < 1710) {    # this may not get hit on futures ...
        x <- most_recent_n_days(x,ndays)
        tgt <- as.POSIXct(paste(format(as.Date(curr_t)), "17:09:59.999"))
        dt <- max(1,round(as.numeric(difftime(tgt, curr_t, units="secs")),0))
        msg(index(now_t), "after close; sleeping", dt, "seconds")
        Sys.sleep(dt)
        market_closed <- TRUE
        next
    } else if ((now >= 1710 || now < 1526) && market_closed) {
        x <- most_recent_n_days(x,ndays)
        msg(index(now_t), "market open")
        market_closed <- FALSE
        prevVol <- 0
    }
    y <- redisMonitorChannels(redis)
    if (!is.null(y)) {
        x <- rbind(x,y)
        x <- x[!duplicated(index(x))]
        ll <- tail(y,1)
        msg(Sys.time(), "data", format(index(ll)), "close", ll[1,"Close"], "change", ll[1, "Change"])
    } else {
        msg(index(now_t), "null data in y")
    }
    show_plot(symbol, x)
}
# never reached but could do 'redis$unsubscribe(symbol)' here
