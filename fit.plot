
set xlabel 'Year'
set ylabel 'Relative Performance'
set terminal png
set logscale y

set output 'specINTDataOnly.png'

plot [:] [1:10000] 'specINT95.speed' title "specINT95", 'specINT2000.speed' using 1:(.1*$2) title "specINT2000" , 'specINT2006.speed' using 1:($2*0.1*137) title "specINT2006"


set output 'specINTEarlyFit.png'

plot [:] [1:10000] 'specINT95.speed' title "specINT95", 'specINT2000.speed' using 1:(.1*$2) title "specINT2000" , 'specINT2006.speed' using 1:($2*0.1*137) title "specINT2006", 1.5*(1.47**(x-1991)) title '47% per year' 

set output 'specINTEarlyMidFit.png'


plot [:] [1:10000] 'specINT95.speed' title "specINT95", 'specINT2000.speed' using 1:(.1*$2) title "specINT2000" , 'specINT2006.speed' using 1:($2*0.1*137) title "specINT2006", 1.5*(1.47**(x-1991)) title '47% per year' , 45*(1.39**(x-2000)) title '39% per year'

set output 'specINTAllFit.png'

plot [:] [1:100000] 'specINT95.speed' title "specINT95", 'specINT2000.speed' using 1:(.1*$2) title "specINT2000" , 'specINT2006.speed' using 1:($2*0.1*137) title "specINT2006", 'specINT2017.speed' using 1:($2*118) title "specINT2017 Perf",  1.5*(1.47**(x-1991)) title '47% per year' , 45*(1.39**(x-2000)) title '39% per year', 170*(1.25**(x-2004)) title '25% per year', 700*(1.08**(x-2010)) title '8% per year'

unset logscale y
set output 'specINTAllFit-nolog.png'

plot [:] [1:3000] 'specINT95.speed' title "specINT95", 'specINT2000.speed' using 1:(.1*$2) title "specINT2000" , 'specINT2006.speed' using 1:($2*0.1*137) title "specINT2006", 'specINT2017.speed' using 1:($2*118) title "specINT2017 Perf",  1.5*(1.47**(x-1991)) title '47% per year' , 45*(1.39**(x-2000)) title '39% per year', 170*(1.25**(x-2004)) title '25% per year', 700*(1.08**(x-2010)) title '8% per year'
