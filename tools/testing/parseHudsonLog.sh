#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` <log>"
    exit 1
fi

log=$1

grep 'out\.\.\. passed' $log | sed 's/\.out\.\.\. .*//' | sed 's/\/results//' | sed 's/^/\.\/passes\.sh /' > $log.tmp
bash -x $log.tmp