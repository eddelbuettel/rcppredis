
suppressMessages({
    library(quantmod)                   # plotting
    library(xts) 		                # data container
    library(anytime)                    # convenient time parsing
    library(RcppRedis)                  # data cache and pub/sub
    #library(ggplot2)                   # for show_plot_gg
    #library(patchwork)                 # for show_plot_gg
})

## Parameters
defaultTZ <- "America/Chicago"
symbols <- c("BTC=F", "CL=F", "ES=F", "GC=F")
host <- "localhost"
ndays <- 2

## Callback handler for convenience
multiSymbolRedisMonitorChannels <- function(context, type="rdata", env=.GlobalEnv) {
    res <- context$listen(type)
    if (length(res) != 3 || res[[1]] != "message") return(res)
    if (exists(res[[2]], mode="function", envir=env)) {
        data <- do.call(res[[2]], as.list(res[[3]]), envir=env)
        val <- list(symbol=res[[2]], data=data)
        return(val)
    }
    res
}

most_recent_n_days <- function(rl, n=2, minobs=1500) {
    rl <- lapply(rl, function(x) {
        tt <- table(as.Date(index(x)))
        if (length(tt) < n || nrow(x) < minobs) return(x)
        cutoff <- paste(format(as.Date(names(head(tail(tt[tt>minobs], n), 1)))), "00:00:00")
        newx <- x[ index(x) >= as.POSIXct(cutoff) ]
        #msg(Sys.time(), "most recent data starting at", format(head(index(newx),1)))
        newx
    })
}

get_all_data <- function(symbols, host) {
    rl <- sapply(symbols, simplify=FALSE, FUN=function(symbol) {
        m <- redis$zrange(symbol, 0, -1)
        colnames(m) <- c("Time", "Close", "Change", "PctChange", "Volume")
        y <- xts(m[,-1,drop=FALSE], order.by=anytime(as.numeric(m[,1,drop=FALSE])))
        y
    })
}

## using a trick from the BioConductor slack from 2022-02-15
show_plot_base <- function(symbols, rl) {
    pdf(NULL)
    op <- par(no.readonly=TRUE)
    dev.control(displaylist = "enable")
    par(mfrow=c(length(symbols), 1))
    res <- lapply(symbols, function(symbol) {
        x <- rl[[symbol]]
        lastx <- tail(coredata(x),1)
        cname <- paste(symbol,
                       format(lastx[,"Close"]),
                       round(lastx[,"Change"], 2),
                       round(lastx[,"PctChange"], 5),
                       format(Sys.time(), "%H:%M:%S"),
                       sep = "   ")
        ##print(dim(x))
        ##if (nrow(x) > 1)
        cs <- quantmod::chart_Series(x[,"Close"], name = cname)
        ## cf issue 270
        ##    chart_Series(IBM, name=NULL)
        ##    title('IBM', font.main=3, col.main="#ff0000", line=2.5)
        plot(cs)
    })
    par(op)
    p <- grDevices::recordPlot()
    invisible(dev.off())
    print(p)
}

## alternate using ggplot and patchwork
show_plot_gg <- function(symbols, rl) {
    res <- lapply(symbols, function(symbol) {
        x <- rl[[symbol]]
        lastx <- tail(coredata(x),1)
        cname <- paste(symbol,
                       format(lastx[,"Close"]),
                       round(lastx[,"Change"], 2),
                       round(lastx[,"PctChange"], 5),
                       format(Sys.time(), "%H:%M:%S"),
                       sep = "   ")
        xx <- data.frame(Date=index(x), coredata(x))
        ggplot(data=xx) + aes(x=Date, y=Close) +  geom_line() +
            labs(title = cname, y = "", x = "") +
            theme(plot.title = element_text(size = 9),
                  plot.margin = margin(0, 0, 0, 0, "cm"))
    })
    print(res[[1]] / res[[2]] / res[[3]])
}

show_plot <- show_plot_base
#show_plot <- show_plot_gg

msg <- function(ts, ...) {
    op <- options(digits.secs=3)
    cat(format(ts), ..., "\n")
    options(op)
}

redis <- new(Redis, host)
if (redis$ping() != "PONG") stop("No Redis server?", call. = FALSE)
x <- get_all_data(symbols, host)
x <- most_recent_n_days(x, ndays)
show_plot(symbols, x)

env <- new.env() # local environment for callbacks

## This is the callback function assigned to a symbol
.data2xts <- function(x) {
    m <- read.csv(text=x, sep=";", header=FALSE, col.names = c("Time", "Close", "Change", "PctChange", "Volume"))
    y <- xts(m[,-1,drop=FALSE], anytime(as.numeric(m[,1,drop=FALSE])))
    y
}
## With environment 'env', assign callback function for each symbol
res <- sapply(symbols, function(symbol) {
    assign(symbol, .data2xts, envir=env)  # programmatic version `ES=F` <- function(x) ....
    redis$subscribe(symbol)
})


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
    }
    rl <- multiSymbolRedisMonitorChannels(redis, env=env)  	# monitor channels in context of 'env'
    if (is.list(rl)) {
        sym <- rl[["symbol"]]
        x[[sym]] <- rbind(x[[sym]], rl[["data"]])
        z <- tail(x[[sym]],1)
        if (sym == symbols[3]) msg(Sys.time(), "data", format(index(z)), "close", z[1,"Close"], "change", z[1, "PctChange"])
    } else {
        msg(index(now_t), "null data in y")
    }
    show_plot(symbols, x)
}
# never reached but could do 'redis$unsubscribe(symbol)' here
