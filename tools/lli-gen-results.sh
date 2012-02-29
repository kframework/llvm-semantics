#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: `basename $0` <indir> <outdir>"
    exit 1
fi

for file in $1/*.ll; do
    echo $file
    out=`lli "$file"`
    ret=$?
    newfilename=`basename $file`
    newfile="$2/$newfilename.out"
    echo "<result>" > $newfile
    echo "  <returnValue>" >> $newfile
    echo "    $ret" >> $newfile
    echo "  </returnValue>" >> $newfile
    echo "</result>" >> $newfile
done
