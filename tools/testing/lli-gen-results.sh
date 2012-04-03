#!/bin/bash
# edited to support multiple nested result directories

if [ $# -ne 2 ]; then
    echo "Usage: `basename $0` <indir> <pathless-outdir>"
	echo "Example: lli-gen-results.sh general results"
    exit 1
fi

for dir in `find $1 -type d`; do
	[ "$2" = `basename $dir` ] && continue
	echo "$dir:"
	outdir="$dir/$2"
	mkdir -p $outdir
	for file in $dir/*.ll; do
		echo "$file"
		grep '@main' $file > /dev/null || continue # skip if no main
		timeout 2 lli "$file" > out.junk.tmp
		ret=$?
		[ $ret -eq 124 ] && continue # skip if timed out
		[ $ret -eq 1 ] && continue # skip if lli had a problem
		newfilename=`basename $file`
		newfile="$outdir/$newfilename.out"
		# echo $newfile
		mv -f out.junk.tmp $newfile
		echo "<result>" >> $newfile
		echo "  <returnValue>" >> $newfile
		echo "    $ret" >> $newfile
		echo "  </returnValue>" >> $newfile
		echo "</result>" >> $newfile
	done
done
