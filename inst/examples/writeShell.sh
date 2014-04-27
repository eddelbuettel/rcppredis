#!/bin/bash

key1="ex:ascii:simpleString"
val1="abracadrabra"
res=$(redis-cli set ${key1} ${val1})
echo "Set '${val1}' under '${key1}' with result ${res}"

key2="ex:ascii:scalarVal"
val2=42
res=$(redis-cli rpush ${key2} ${val2})
echo "Pushed '${val2}' under '${key2}' with result ${res}"

key3="ex:ascii:vectorVal"
val3="40,41,42"
res=$(redis-cli rpush ${key3} ${val3})
echo "Pushed '${val3}' under '${key3}' with result ${res}"
