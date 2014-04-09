
library(RcppRedis)
library(rredis)
library(rbenchmark)

data(trees)
fit <- lm(log(Volume) ~ log(Girth) + log(Height), data=trees)

rawfit <- rawToChar(serialize(fit,NULL,ascii=TRUE))

redis <- new(Redis)
rredis::redisConnect()

hiredis <- function() redis$exec(paste("SET fits1 ",
                                       rawToChar(serialize(fit,NULL,ascii=TRUE)),
                                       sep=""))
rredis <- function() rredis::redisSet("fits2", fit)

res <- benchmark(hiredis(), rredis(), replications=100)[,1:4]
print(res)

all.equal(unserialize(charToRaw(redis$exec("GET fits1"))), fit)
all.equal(rredis::redisGet("fits2"), fit)

if (redisExists("abc1")) redisDelete("abc1")
if (redisExists("abc2")) redisDelete("abc2")

abc <- paste0(rep(letters,10),collapse="")

hiredisP<- function() redis$exec(paste0("RPUSH abc1 ",rawToChar(serialize(abc,NULL,ascii=TRUE))))
rredisP <- function() rredis::redisRPush("abc2", abc)

resP <- benchmark(hiredisP(), rredisP(), replications=100)[,1:4]
print(resP)


hiredisLR <-	function() lapply(redis$exec("LRANGE abc1 0 -1"),function(x)unserialize(charToRaw(x)))
rredisLR  <-  function() redisLRange("abc2",0,-1)

resLR <- benchmark(hiredisLR(), rredisLR(), replications=100)[,1:4]
print(resLR)

abc1 <- hiredisLR()
abc2 <- rredisLR()
abcList <- lapply(1:101,function(x) abc)

all.equal(abc1, abcList)
all.equal(abc1, abc2)


