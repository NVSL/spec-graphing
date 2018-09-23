#!/usr/bin/python

import sys
import re

in1 = open(sys.argv[1], "r")
in2 = open(sys.argv[2], "r")
scale1 = sys.argv[3]
in3 = open(sys.argv[4], "r")
scale2 = sys.argv[5]
out = open(sys.argv[6], "w")

lines1 = in1.readlines();

for l in lines1:
    out.write(l)

lines2 = in2.readlines();

for l in lines2:
    p = re.split(' ',l)
    if len(p) != 2:
        print "****", l,
    else:
        out.write("%f %f\n" % (float(p[0]), float(p[1]) * float(scale1)))

lines3 = in3.readlines();

for l in lines3:
    p = re.split(' ',l)
    if len(p) != 2:
        print "****", l,
    else:
        out.write("%f %f\n" % (float(p[0]), float(p[1]) * float(scale2)))
