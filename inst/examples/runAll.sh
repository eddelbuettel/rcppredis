#!/bin/bash

function runShell {
    ./writeShell.sh

    ./readShell.sh
    ./readShell.sh

}

function runPython {
    ./writePython.py

    ./readPython.py
    ./readPython.py

}

function cleanup {
    # cleanup
    redis-cli del 'ex:ascii:simpleString'
    redis-cli del 'ex:ascii:scalarVal'
    redis-cli del 'ex:ascii:vectorVal'
}


runShell
runPython
cleanup
