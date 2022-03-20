
## Version 1 using rredis
if (Sys.getenv("RunRcppRedisTests") == "yes" && requireNamespace("rredis", quietly=TRUE)) {
    suppressMessages(require(rredis))
    ## redusMonitorChannels blocks forever until a message is received. We
    ## use a background R process to send us some test messages.
    publisher_rredis <- function() {
        Rbin <- paste(R.home(component="bin"), "R", sep="/")
        cmd <- "suppressMessages(require(rredis));redisConnect();Sys.sleep(1);redisPublish('channel1', charToRaw('1'));redisPublish('channel2', charToRaw('2'))"
        args <- c("--slave", "-e", paste("\"", cmd, "\"", sep=""))
        system(paste(c(Rbin, args), collapse=" "), intern=FALSE, wait=FALSE)
    }
    checkEquals <- function(x, y) if (!isTRUE(all.equal(x, y, check.attributes=FALSE))) stop()

    redisConnect()
    redisPublish("channel1", charToRaw("A raw charachter data message example"))
    redisPublish("channel2", charToRaw("A raw charachter data message example"))

    ## Define a callback function to process messages from channel 1:
    channel1 <- function(x) {
        cat("Message received from channel 1: ",x,"\n")
        checkEquals("1", x)
    }
    ## Define a callback function to process messages from channel 2:
    channel2 <- function(x) {
        cat("Message received from channel 2: ",x,"\n")
        checkEquals("2", x)
    }
    redisSubscribe(c('channel1','channel2'))
    ## Monitor channels for a few seconds until the background R process sends us some messages...
    publisher_rredis()
    redisMonitorChannels()
    redisMonitorChannels()
    redisUnsubscribe(c('channel1','channel2'))

    cat("Done rredis\n")
}

## Version 2 using RcppRedis
if (Sys.getenv("RunRcppRedisTests") == "yes") {
    suppressMessages(library(RcppRedis))
    publisher_rcppredis <- function() {
        Rscript <- paste(R.home(component="bin"), "Rscript", sep="/")
        cmd <- "suppressMessages(library(RcppRedis)); r <- new(Redis); Sys.sleep(1); r\\$publish('channel1', '1'); r\\$publish('channel2', '2')"
        args <- c("-e", paste("\"", cmd, "\"", sep=""))
        system(paste(c(Rscript, args), collapse=" "), intern=FALSE, wait=FALSE)
    }

    checkEquals <- function(x, y) if (!isTRUE(all.equal(x, y, check.attributes=FALSE))) stop()

    redis <- new(Redis)
    redis$publish("channel1", charToRaw("A raw charachter data message example"))
    redis$publish("channel2", charToRaw("A raw charachter data message example"))

    ## Define a callback function to process messages from channel 1:
    channel1 <- function(x) {
        cat("Message received from channel 1: ",x,"\n")
        checkEquals("1", x)
    }
    ## Define a callback function to process messages from channel 2:
    channel2 <- function(x) {
        cat("Message received from channel 2: ",x,"\n")
        checkEquals("2", x)
    }
    redis$subscribe(c('channel1','channel2'))
    ## Monitor channels for a few seconds until the background R process sends us some messages...
    publisher_rcppredis()
    redisMonitorChannels(redis)
    redisMonitorChannels(redis)
    redis$unsubscribe(c('channel1','channel2'))

    cat("Done rcppredis\n")
}
