#!/usr/bin/env python

import redis

redishost  = "localhost"
redisserver = redis.StrictRedis(redishost)

key1 = "ex:ascii:simpleString"
val1 = "abracadabra"
res = redisserver.set(key1, val1)
print "Set", val1, "under", key1, "with result", res

key2 = "ex:ascii:scalarVal"
val2 = 42
res = redisserver.rpush(key2, val2)
print "Pushed", val2, "under", key2, "with result", res

key3 = "ex:ascii:vectorVal"
val3 = [40, 41, 42]
res = redisserver.rpush(key3, val3)
print "Pushed", val3, "under", key3, "with result", res
