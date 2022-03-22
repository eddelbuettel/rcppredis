## cf https://gist.github.com/joshuaulrich/ee11ef67b1461df399b84efd3c8f9f67#file-intraday-sp500-r

suppressMessages({
    library(quantmod)
    library(RcppRedis)
})

defaultTZ <- "America/Chicago"
symbols <- c("BTC=F", "CL=F", "ES=F", "GC=F")

get_data <- function(symbols) {
    quotes <- getQuote(symbols)
    quotes$Open <- quotes$High <- quotes$Low <- NULL
    colnames(quotes) <- c("Time", "Close", "Change", "PctChange", "Volume")
    quotes$Time <- as.numeric(quotes$Time)
    quotes
}

store_data <- function(curr_t, res) {
    symbols <- rownames(res)
    res <- as.matrix(res)
    for (symbol in symbols) {
        vec <- res[symbol,,drop=FALSE]
        #print(vec)
        if (redis$ping() == "PONG") {
            redis$zadd(symbol, vec)
            redis$publish(symbol, paste(vec,collapse=";"))
        } else {
            msg(curr_t, "skipping update, no redis ?")
        }
    }
}

msg <- function(ts, ...) {
    op <- options(digits.secs=3)
    cat(format(ts), ..., "\n")
    options(op)
}

x <- NULL
redis <- new(Redis, "localhost")
if (redis$ping() != "PONG") stop("No Redis server?", call. = FALSE)

market_closed <- TRUE
errored <- FALSE
prevVol <- 0
res <- get_data(symbols)
repeat {
    curr_t <- Sys.time()
    now_t <- xts(, curr_t)
    now <- .indexhour(now_t)*100 + .indexmin(now_t)
    if (now >= 1525 && now < 1710) {
        ## we need one NA observations to plot a gap
        vec <- c(Time = as.numeric(curr_t),
                 Close = NA_real_,
                 Change = NA_real_,
                 PctChange = NA_real_,
                 Volume = NA_real_)
        nres <- res
        for (symbol in symbols)
            nres[symbol,] <- vec
        store_data(curr_t, nres)
        tgt <- as.POSIXct(paste(format(as.Date(curr_t)), "17:09:59.999"))
        dt <- max(1L,round(as.numeric(difftime(tgt, curr_t, units="secs")),0))
        msg(index(now_t), "after close; setting NA, sleeping", dt, "seconds")
        Sys.sleep(dt)
        market_closed <- TRUE
        next
    } else if ((now >= 1710 || now < 1526) && market_closed) {
        msg(curr_t, "market open")
        market_closed <- FALSE
        #prevVol <- 0
    }
    res <- try(get_data(symbols), silent = TRUE)
    if (inherits(res, "try-error")) {
        msg(curr_t, "Error:", attr(res, "condition")[["message"]])
        errored <- TRUE
        Sys.sleep(15)
        next
    } else if (errored) {
        errored <- FALSE
        msg(curr_t, "...recovered")
    }
    v <- res[3, "Volume"]
    if (v != prevVol) {
        store_data(curr_t, res)
        msg(curr_t, "Storing data from", format(anytime::anytime(res[3,"Time"]))) #, "for", paste(rownames(res)[1], res[1, "Change"], rownames(res)[2], res[2, "Change"], collapse=","))
    }
    prevVol <- v
    Sys.sleep(10)
}
