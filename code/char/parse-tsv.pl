#!/usr/bin/env perl

use Smart::Comments;
use strict;

my @tbl;
while (<>) {
    chomp;
    # フィールドを分割する
    my @cols = split /\t/, $_;
    # \t および \t を置換する
    @cols = map { s/\\t/\t/g; s/\\n/\n/g; $_; } @cols;
    push @tbl, [@cols];
}
### @tbl
