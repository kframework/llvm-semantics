#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: `basename $0` <passingTest>"
    exit 1
fi

DIR=`dirname $1`
FILE=`basename $1`
TARGET=`dirname ${1#regression/}`

# should test existence of some stuff
mkdir -p "$TARGET/results"

git mv $1 "$TARGET/"
git mv "$DIR/results/$FILE.out" "$TARGET/results/$FILE.out"