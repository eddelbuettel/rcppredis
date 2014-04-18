#!/usr/bin/env python

import redis

redishost  = "localhost"
redisserver = redis.StrictRedis(redishost)

key1 = "scalarVal"
val1 = 42
res = redisserver.rpush(key1, val1)
print "Pushed", val1, "under", key1, "with result", res

key2 = "vectorVal"
val2 = [40, 41, 42]
res = redisserver.rpush(key2, val2)
print "Pushed", val2, "under", key2, "with result", res

