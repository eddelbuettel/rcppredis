#!/usr/bin/env python

import redis

redishost  = "localhost"
redisserver = redis.StrictRedis(redishost)

key1 = "scalarVal"
val1 = redisserver.lpop(key1)
print "Dequeued", val1, "from", key1

key2 = "vectorVal"
val2 = redisserver.lpop(key2)
print "Enqueued", val2, "from", key2
