default: specINT.png specFP.png specINTDataOnly.png specINTEarlyFit.png specINTAllFit.png specINTEarlyMidFit.png

specINT95.csv.html: 
	wget 'http://www.spec.org/cgi-bin/osgresults?conf=cint95;op=dump;format=csv' -O $@

specINT2000.csv.html: 
	wget 'http://www.spec.org/cgi-bin/osgresults?conf=cint2000;op=dump;format=csv' -O $@
specINT2006.csv.html: 
	wget 'http://www.spec.org/cgi-bin/osgresults?conf=cint2006;op=dump;format=csv' -O $@

specFP2000.csv.html: 
	wget 'http://www.spec.org/cgi-bin/osgresults?conf=cfp2000;op=dump;format=csv' -O $@
specFP2006.csv.html: 
	wget 'http://www.spec.org/cgi-bin/osgresults?conf=cfp2006;op=dump;format=csv' -O $@

%.csv : %.csv.html extractCSV.py
	./extractCSV.py $< $@

specINT2017.csv: 
	wget 'https://www.spec.org/cgi-bin/osgresults?conf=cint2017;op=dump;format=csvdump' -O $@
specFP2017.csv: 
	wget 'https://www.spec.org/cgi-bin/osgresults?conf=cfp2017;op=dump;format=csvdump' -O $@

%2017.clock: %2017.csv plotifyCSV.py
	./plotifyCSV.py 20 7 $< $@ 

%2017.speed: %2017.csv plotifyCSV.py
	./plotifyCSV.py 20 22 $< $@ 

%2006.clock: %2006.csv plotifyCSV.py
	./plotifyCSV.py 22 8 $< $@ 

%2006.speed: %2006.csv plotifyCSV.py
	./plotifyCSV.py 22 24 $< $@ 

%2000.clock: %2000.csv plotifyCSV.py
	./plotifyCSV.py 15 7 $< $@ 

%2000.speed: %2000.csv plotifyCSV.py
	./plotifyCSV.py 15 17 $< $@ 

%95.speed: %95.csv plotifyCSV.py 
	./plotifyCSV.py 13 15 $< $@ 

%95.clock: %95.csv plotifyCSV.py 
	./plotifyCSV.py 13 15 $< $@ 

specINTall.speed: specINT2000.speed specINT2006.speed specINT95.speed combine.py Makefile
	./combine.py specINT95.speed specINT2000.speed 0.1 specINT2006.speed 13.7 specINT2017.speed 1 $@

%.max : %.speed
	./maxify.py $< $@

specINT.png specINTclock.png specINTcombined.png: specINT2000.speed specINT2006.speed specINT2017.speed specINT95.speed specINT2000.clock specINT2006.clock specINT2017.clock specINT95.clock  specINT.plot 
	gnuplot specINT.plot

specFP.png: specFP2000.speed specFP2006.speed specFP.plot
	gnuplot specFP.plot

specINTDataOnly.png specINTEarlyFit.png specINTEarlyMidFit.png specINTAllFit.png: fit.plot
	gnuplot fit.plot

#plot 'specINT2006.plot' using 1:($2*137) , 'specINT2000.plot' 
