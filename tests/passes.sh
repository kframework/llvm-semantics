#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` <passingTest>"
    exit 1
fi

DIR=`dirname $1`
FILE=`basename $1`

# should test existence of some stuff

git mv $1 "regression/$DIR/"
git mv "$DIR/results/$FILE.out" "regression/$DIR/results/$FILE.out"