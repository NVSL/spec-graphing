
set xlabel 'Year'
set ylabel 'Relative Performance'
set terminal png

set output 'specINT.png'
set logscale y
plot [1990:] [1:100000] 'specINT95.speed' title "specINT95 Perf", 'specINT2000.speed' using 1:(.1*$2) title "specINT2000 Perf", 'specINT2006.speed' using 1:($2*13.7) title "specINT2006 Perf", 'specINT2017.speed' using 1:($2*118) title "specINT2017 Perf"

set ylabel 'Clock speed (Mhz)'
set logscale y
set output 'specINTclock.png'
plot  [1990:] [1:55000]   'specINT2000.clock' title 'specINT2000', 'specINT2006.clock' title 'specINT2006' , 'specINT2017.clock' title 'specINT2017' 



set ylabel 'Relative Performance or Clock speed (Mhz)'
set logscale y
set output 'specINTcombined.png'
plot [1990:] [1:1000000] 'specINT95.speed' title "specINT95 Perf", 'specINT2000.speed' using 1:(.1*$2) title "specINT2000 Perf" , 'specINT2006.speed' using 1:($2*13.7) title "specINT2006 Perf", 'specINT2017.speed' using 1:($2*118) title "specINT2017 Perf", 'specINT2000.clock' title 'specINT2000 Mhz', 'specINT2006.clock' title 'specINT2006 Mhz' , 'specINT2017.clock' title 'specINT2017 Mhz' 

set ylabel 'Relative Performance'
set output 'specINT-nolog.png'
set nologscale y
plot [1990:] [1:2000] 'specINT95.speed' title "specINT95 Perf", 'specINT2000.speed' using 1:(.1*$2) title "specINT2000 Perf", 'specINT2006.speed' using 1:($2*13.7) title "specINT2006 Perf", 'specINT2017.speed' using 1:($2*118) title "specINT2017 Perf"


set ylabel 'Clock speed (Mhz)'
set nologscale y
set output 'specINTclock-nolog.png'
plot  [1990:] [1:5500]   'specINT2000.clock' title 'specINT2000', 'specINT2006.clock' title 'specINT2006' 
