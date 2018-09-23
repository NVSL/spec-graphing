
set xlabel 'Year'
set ylabel 'specFP2000 performance"
set terminal png
set output 'specFP.png'

plot [:] [1:] 'specFP2000.data' , 'specFP2006.data' using 1:($2*165)