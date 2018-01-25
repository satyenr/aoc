.PHONY: install dirs cpp

bin      = bin
src      = src
build    = build
install  = install --compare -vD
cpp      = g++
cppflags = -Wall -std=c++11 -O2

dirs:
	mkdir -p $(build)/$(bin)
	mkdir -p $(bin)

cpp: dirs
	$(cpp) $(cppflags) -o build/bin/five $(src)/five.cpp
	$(cpp) $(cppflags) -o build/bin/aoc $(src)/main.cpp

install: cpp
	$(install) -m 755 $(build)/$(bin)/* $(bin)/ 

clean:
	rm -rf .stack-work $(build) $(bin)
