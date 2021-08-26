#!/bin/sh

for i in `seq 100`
do
    printf 'Loading object files...%3d%%\r' $i
    sleep 0.05
done
echo 'Loading object files... Done'
