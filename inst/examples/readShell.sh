#!/bin/bash

key1="scalarVal"
val1=$(redis-cli lpop ${key1})
echo "Got '${val1}' from '${key1}'"

key2="vectorVal"
val2=$(redis-cli lpop ${key2})
echo "Got '${val2}' from '${key2}'"
