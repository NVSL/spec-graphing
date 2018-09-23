#!/usr/bin/python

import re
import sys
start = re.compile('<PRE>')
end = re.compile('</PRE>')

htmlIn = open(sys.argv[1], "r")
csvOut = open(sys.argv[2], "w")

#specReader = csv.reader(open(sys.argv[1]))

lines = htmlIn.readlines();

printing = 0

for l in lines:
    if end.match(l):
        printing = 0
    if printing :
        csvOut.write(l)
    if start.match(l):
        printing = 1
