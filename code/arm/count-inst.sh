#!/bin/sh
# /usr/bin 以下の全プログラムで使用されている機械語命令の出現回数を求める
# $Id: count-inst.sh,v 1.1 2021/06/18 12:58:24 ohsaki Exp $
# example: ./count-inst.sh >counts

for i in /usr/bin/*
do
    # ELF 形式のプログラムをインテル構文で逆アセンブルする
    file $i | grep ELF >/dev/null && objdump -d $i
done | 
    # 命令のニーモニックを抽出
    grep '^    ' | awk '{ print $3 }' |
    # 出現回数を数える
    sort | uniq -c |
    # 出現回数の降順にソート
    sort -rn


