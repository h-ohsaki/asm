#!/bin/sh
# 順位、第 1 カラムの割合を表示する

file=$1; shift

# 第 1 カラムの総和を計算
sum=`awk '{ sum += $1 } END { print sum }' $file`

awk "{ printf \"%6.3f %s\n\", \$1 / $sum * 100, \$2 }" $file | cat -n
