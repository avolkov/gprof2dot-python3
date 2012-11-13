#!/bin/bash

rm -f out.png test.profile out.profile

python -m "cProfile" -o test.profile hw.py

gprof2dot -f pstats test.profile

gprof2dot -f pstats test.profile > out.profile



dot -Tpng -o out.png out.profile

if [ -f out.png ]
then
    echo "Success!"
    exit 0
else
    echo "Failed!"
    exit 1
fi
