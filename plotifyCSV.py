#!/usr/bin/python

import csv
import sys

specReader = csv.reader(open(sys.argv[3]))

plotOut = open(sys.argv[4], "w")

def floatYear(a):
    month = a[0:3]
    year = float(a[4:9])
    if month == 'Jan':
        m = 0
    elif month == 'Feb':
        m = 1
    elif month == 'Mar':
        m = 2
    elif month == 'Apr':
        m = 3
    elif month == 'May':
        m = 4
    elif month == 'Jun':
        m = 5
    elif month == 'Jul':
        m = 6
    elif month == 'Aug':
        m = 7
    elif month == 'Sep':
        m = 8
    elif month == 'Oct':
        m = 9
    elif month == 'Nov':
        m = 10
    elif month == 'Dec':
        m = 11

    return year + (m+0.0)/12.0


first = 1
for row in specReader:
    if first:
        first = 0
    elif len(row) >= 6:
        plotOut.write("%f %s\n" % (floatYear(row[int(sys.argv[1])]),row[int(sys.argv[2])]));

#15 17
