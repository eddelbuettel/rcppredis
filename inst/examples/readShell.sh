#!/bin/bash

key1="ex:ascii:simpleString"
val1=$(redis-cli get ${key1})
echo "Got'ed '${val1}' from '${key1}'"

key2="ex:ascii:scalarVal"
val2=$(redis-cli lpop ${key2})
echo "LPop'ed '${val2}' from '${key2}'"

key3="ex:ascii:vectorVal"
val3=$(redis-cli lpop ${key3})
echo "LPop'ed '${val3}' from '${key3}'"
