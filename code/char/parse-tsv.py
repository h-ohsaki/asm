#!/usr/bin/env python3
import sys

file = sys.argv[1]
with open(file) as f:
    tbl = []
    for line in f:
        line = line.rstrip()
        cols = line.split('\t')
        cols = [f.replace('\\t', '\t').replace('\\n', '\n') for f in cols]
        tbl.append(cols)
    print(tbl)
