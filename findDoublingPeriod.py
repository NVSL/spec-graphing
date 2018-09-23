#!/usr/bin/python

import sys
import re

in1 = open(sys.argv[1], "r")
#out = open(sys.argv[2], "w")

lines1 = in1.readlines();
lines1.sort()

x = []
y = []
n = []


for l in lines1:
    p = re.split('\s+',l)
    x.append(float(p[0]));
    y.append(float(p[1]));

for i in range(len(x) - 1):

     c = i

     while c < len(x) - 1 and y[c + 1] < 1.25*y[i]:
         c = c + 1

     if c == len(x) - 1:
         break

     n.append((x[c]-x[i])) # + (x[c+1] - x[c])*(2*y[i] - y[c])/(y[c+1] - y[c]))

     print x[i], n[i]

