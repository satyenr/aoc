.PHONY: install dirs cpp

bin      = bin
src      = src
build    = build
install  = install --compare -vD
cpp      = g++
cppflags = -Wall -std=c++11

dirs:
	mkdir -p $(build)/$(bin)
	mkdir -p $(bin)

cpp: dirs
	$(cpp) $(cppflags) -o build/bin/day-05-2017 $(src)/day-05-2017.cpp
	$(cpp) $(cppflags) -o build/bin/aoc $(src)/aoc.cpp

install: cpp
	$(install) -m 755 $(build)/$(bin)/* $(bin)/ 

clean:
	rm -rf .stack-work $(build) $(bin)