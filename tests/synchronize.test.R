library(Rhiredis)

con <- redisConnect()
options(Rhiredis.connect = con)

system.time({
	for(i in 1:100) {
		redisLPUSH("test", "as df")
	}
})
