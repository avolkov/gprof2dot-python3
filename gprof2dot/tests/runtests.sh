#!/bin/bash

TESTDIR=`dirname "$0"`
GPROF2DOT=gprof2dot

FORCE=
if [ "$1" == "-f" ]
then
       FORCE=y
       shift
fi

if [ "$1" ]
then
	FORMATS=$@
else
	FORMATS="
		prof
		pstats
		oprofile
		shark
		callgrind
		hprof
		perf
	"
fi

for FORMAT in $FORMATS
do
	for PROFILE in $TESTDIR/*.$FORMAT
	do
		NAME=${PROFILE%%.$FORMAT}
		command="$GPROF2DOT -f $FORMAT -o $NAME.dot $PROFILE"
		echo $command
		echo $command | sh || continue
		command="dot -Tpng -o $NAME.png $NAME.dot"
		echo $command
		echo $command | sh || continue

		if [ ! -f $NAME.orig.dot -o "$FORCE" ]
		then
			cp -f $NAME.dot $NAME.orig.dot
			cp -f $NAME.png $NAME.orig.png
		else
			diff $NAME.orig.dot $NAME.dot
		fi
		unset command
	done
done
