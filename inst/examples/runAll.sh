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
    redis-cli del 'ex:simpleString'
    redis-cli del 'ex:scalarVal'
    redis-cli del 'ex:vectorVal'
}


runShell
runPython
cleanup
