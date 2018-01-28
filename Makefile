.PHONY: dirs cpp

bin      = bin
src      = src
build    = _build .stack-work
install  = install --compare -vD
cpp      = g++
cppflags = -Wall -std=c++11 -O2

all: cpp elixir haskell

dirs:
	mkdir -p $(bin)

cpp: dirs
	$(cpp) $(cppflags) -o $(bin)/five    $(src)/five.cpp
	$(cpp) $(cppflags) -o $(bin)/aoc-cpp $(src)/main.cpp

haskell: dirs
	stack install

elixir: dirs
	mix escript.build

clean:
	rm -rf $(build)

deepclean: clean
	rm -rf $(bin)
