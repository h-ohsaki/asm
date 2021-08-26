#!/usr/bin/env python3
import csv
import sys

file = sys.argv[1]
with open(file) as f:
    tbl = []
    reader = csv.reader(f)
    for row in reader:
        tbl.append(row)
    print(tbl)
        