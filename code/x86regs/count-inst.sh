#!/bin/sh
# /usr/bin 以下の全プログラムで使用されている機械語命令の出現回数を求める
# $Id: count-inst.sh,v 1.4 2021/03/08 00:04:29 ohsaki Exp $
# example: ./count-inst.sh >counts

for i in /usr/bin/*
do
    # ELF 形式のプログラムをインテル構文で逆アセンブルする
    file $i | grep ELF >/dev/null && objdump -d $i -M intel 
done | 
    # 命令のニーモニックを抽出
    cut -d '	' -f3 -s | cut -d ' ' -f1 | grep -v '^$' |
    # 出現回数を数える
    sort | uniq -c |
    # 出現回数の降順にソート
    sort -rn


