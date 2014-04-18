#!/bin/bash

key1="scalarVal"
val1=42
res=$(redis-cli rpush ${key1} ${val1})
echo "Pushed '${val1}' under '${key1}' with result ${res}"

key2="vectorVal"
val2="40,41,42"
res=$(redis-cli rpush ${key2} ${val2})
echo "Pushed '${val2}' under '${key2}' with result ${res}"
