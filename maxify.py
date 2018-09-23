#!/usr/bin/python

import sys
import re

in1 = open(sys.argv[1], "r")
out = open(sys.argv[2], "w")

lines1 = in1.readlines();
lines1.sort()

maxV = 0;
for l in lines1:
    p = re.split(' |\n',l)
    if float(p[1]) > maxV:
        maxV = float(p[1])
        out.write(p[0] + " " + p[1] + "\n")
        
