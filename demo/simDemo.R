
library(xts)
library(rredis)
library(RcppRedis)
library(rbenchmark)

set.seed(123)

N <- 2500

x <- xts(100*cumprod(1+rnorm(N)*0.005 + (runif(N)>0.95)*rnorm(N)*0.025),
         order.by=Sys.time()+cumsum(exp(3*runif(N))))
plot(x, main="Simulated Series", type='l')

redisConnect()
redis <- new(Redis)

dat <- data.frame(key=as.numeric(index(x)), val=coredata(x))

setAsAscii <- function(dat) {
    N <- nrow(dat)
    ## insertion is row by row
    for (i in 1:N) {
        redisZAdd("ex:ascii:series", dat[i,1], dat[i,])
    }
}

## retrieval is by list
getFromAscii <- function() {
    xx <- do.call(rbind, redisZRange("ex:ascii:series", 0, -1))
    xt <- xts(xx[,-1], order.by=as.POSIXct(xx[,1], origin="1970-01-01"))
}

setAsBinary <- function(dat) {
    redis$zadd("ex:bin:series", as.matrix(dat))
}

getFromBinary <- function() {
    zz <- redis$zrange("ex:bin:series", 0, -1)
    zt <- xts(zz[,-1], order.by=as.POSIXct(zz[,1], origin="1970-01-01"))
}

redis$zremrangebyscore("ex:ascii:series", 0, Inf)
redis$zremrangebyscore("ex:bin:series", 0, Inf)

cat("Writing ascii ... patience\n")
setAsAscii(dat)
setAsBinary(dat)

xt <- getFromAscii()
zt <- getFromBinary()
identical(xt,zt)

redis$zremrangebyscore("ex:ascii:series", 0, Inf)
redis$zremrangebyscore("ex:bin:series", 0, Inf)

benchmark(setAsAscii(dat), setAsBinary(dat), 
          replications=1, order="relative")[,1:4]


benchmark(getFromAscii(), getFromBinary(), replications=10, order="relative")[,1:4]

