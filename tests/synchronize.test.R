library(Rhiredis)

con <- redisConnect()
redisLPUSH("test", "as\ df", con)
