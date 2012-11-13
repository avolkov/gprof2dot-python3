#!/bin/bash

IFS="
"
for k in $(cat .gitignore)
do
	rm -f $k
done
