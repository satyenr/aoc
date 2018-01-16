.PHONY: install dirs cpp

bin     = bin
build   = build
install = install --compare -vD

dirs:
	mkdir -p $(build)/$(bin)
	mkdir -p $(bin)

cpp: dirs
	g++ -Wall -std=c++11 -o build/bin/day-05-2017 src/day-05-2017.cpp

install: cpp
	$(install) -m 755 $(build)/$(bin)/* $(bin)/ 

clean:
	rm -rf .stack-work $(build) $(bin)