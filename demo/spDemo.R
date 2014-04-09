

library(rredis)
suppressMessages(library(RcppRedis))
suppressMessages(library(xts))
library(rbenchmark)

redisConnect()                          # default localhost
redis <- new(Redis)

if (!redisExists("sp500")) {
    suppressMessages(library(quantmod))
    options("getSymbols.warning4.0"=FALSE)   ## suppress some line noise
    sp <- getSymbols("^GSPC", auto.assign=FALSE, from="1950-01-01", to=Sys.Date())
    redisSet("sp500", sp)
    cat("Downloaded SP500 and stored in redis\n")
} else { 
    cat("Retrieving SP500 from redis\n")
    sp <- redisGet("sp500")
}
#print(summary(sp))

rInsert <- function(x) {
    n <- nrow(x)
    key <- "sp500_R"
    if (redisExists(key)) redisDelete(key)
    M <- cbind(as.numeric(index(x)), coredata(x))
    for (i in 1:n) {
        redisRPush(key, M[i,,drop=TRUE])
    }
    invisible(NULL)
}

## This is atrociously slow:
##
## R> system.time(rInsert(sp))
##    user  system elapsed 
##  16.392   0.292 645.643 
## R> 

system.time(m1 <- do.call(rbind, redisLRange("sp500_R", 0, -1)))
system.time(m2 <- do.call(rbind, redis$lrange("sp500_R", 0, -1)))
identical(m1,m2)
system.time(m3 <- redis$listToMatrix(redis$lrange("sp500_R", 0, -1)))
m4 <- m1
dimnames(m4) <- list()
identical(m4,m3)

## approx factor 20
res <- benchmark(do.call(rbind, redisLRange("sp500_R", 0, -1)),
                 do.call(rbind, redis$lrange("sp500_R", 0, -1)),
                 redis$listToMatrix(redis$lrange("sp500_R", 0, -1)),
                 order="relative", replications=25)[,1:4]
print(res)


cInsert <- function(x) {
    n <- nrow(x)
    key <- "sp500_C"
    if (redisExists(key)) redisDelete(key)
    M <- cbind(as.numeric(index(x)), coredata(x))
    for (i in 1:n) {
        redis$listRPush(key, M[i,])
    }
    invisible(NULL)
}


## approx factor 20
res <- benchmark(do.call(rbind, redisLRange("sp500_R", 0, -1)),
                 do.call(rbind, redis$lrange("sp500_R", 0, -1)),
                 redis$listToMatrix(redis$lrange("sp500_R", 0, -1)),
                 redis$listToMatrix(redis$listRange("sp500_C", 0, -1)),
                 order="relative", replications=25)[,1:4]
print(res)


## R> print(res)
##                                                    test replications elapsed relative
## 4 redis$listToMatrix(redis$listRange("sp500_C", 0, -1))           25   0.296    1.000
## 3    redis$listToMatrix(redis$lrange("sp500_R", 0, -1))           25   2.300    7.770
## 2        do.call(rbind, redis$lrange("sp500_R", 0, -1))           25   2.629    8.882
## 1         do.call(rbind, redisLRange("sp500_R", 0, -1))           25  48.028  162.257
## R> 

## redo after Bryan's socket/nagle update to rredis:
##                                                    test replications elapsed relative
## 4 redis$listToMatrix(redis$listRange("sp500_C", 0, -1))           25   0.407    1.000
## 3    redis$listToMatrix(redis$lrange("sp500_R", 0, -1))           25   2.112    5.189
## 2        do.call(rbind, redis$lrange("sp500_R", 0, -1))           25   2.458    6.039
## 1         do.call(rbind, redisLRange("sp500_R", 0, -1))           25  48.367  118.838
## edd@max:~/git/rhiredis/demo$ 
