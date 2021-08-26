#!/bin/sh

printf '\e[1m'	# bold

for color in 30 31 32 33 34 35 36 37
do
    printf '\e[%dm' $color
    echo 'The quick brown fox jumps over the lazy dog.'
done

printf '\e[7m'	# reverse

for color in 30 31 32 33 34 35 36 37
do
    printf '\e[%dm' $color
    echo 'The quick brown fox jumps over the lazy dog.'
done

printf '\e[0m'	# reset
