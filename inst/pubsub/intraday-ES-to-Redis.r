## cf https://gist.github.com/joshuaulrich/ee11ef67b1461df399b84efd3c8f9f67#file-intraday-sp500-r

suppressMessages({
    library(quantmod)
    library(RcppRedis)
})

defaultTZ <- "America/Chicago"
symbol <- "ES=F"

get_data <- function(symbol) {
    quote <- getQuote(symbol)
    vec <- c(Time = as.numeric(quote$`Trade Time`),
             Close = quote$Last,
             Change = quote$Change,
             PctChange = quote$`% Change`,
             Volume = quote$Volume)
    vec
}

store_data <- function(vec, symbol) {
    redis$zadd(symbol, matrix(vec, 1))
    redis$publish(symbol, paste(vec,collapse=";"))
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
        store_data(vec, symbol)
        tgt <- as.POSIXct(paste(format(as.Date(curr_t)), "17:09:59.999"))
        dt <- max(1L,round(as.numeric(difftime(tgt, curr_t, units="secs")),0))
        msg(index(now_t), "after close; setting NA, sleeping", dt, "seconds")
        Sys.sleep(dt)
        market_closed <- TRUE
        next
    } else if ((now >= 1710 || now < 1526) && market_closed) {
        msg(index(now_t), "market open")
        market_closed <- FALSE
        prevVol <- 0
    }
    y <- try(get_data(symbol), silent = TRUE)
    if (inherits(y, "try-error")) {
        msg(curr_t, "Error:", attr(y, "condition")[["message"]])
        errored <- TRUE
        Sys.sleep(15)
        next
    } else if (errored) {
        errored <- FALSE
        msg(curr_t, "...recovered")
    }
    v <- y["Volume"]
    if (v != prevVol) {
        store_data(y, symbol)
        msg(curr_t, "Storing data from", format(anytime::anytime(y["Time"])), "close", y["Close"], "change", y["Change"])
    }
    prevVol <- v
    Sys.sleep(10)
}
