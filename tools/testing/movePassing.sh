#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` <log>"
    exit 1
fi

log=$1

script="\.\.\/tools\/testing\/passes\.sh"

grep 'out\.\.\. passed' $log | sed 's/\.out\.\.\. .*//' | sed 's/\/results//' | sed "s/^/$script /" > $log.tmp
# cat $log.tmp
bash -x $log.tmp