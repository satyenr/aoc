package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
)

func main() {
	input, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		panic("Failed to read input - aborting!")
	}
	lines := strings.Split(strings.TrimSpace(string(input)), "\n")

	// Because Go doesn't provide an easy way to pass the contents of a slice by value
	var offsets [][]int
	offsets = append(offsets, make([]int, len(lines)))
	offsets = append(offsets, make([]int, len(lines)))

	for i, line := range lines {
		if offset, err := strconv.Atoi(line); err != nil {
			panic("Failed to parse input - aborting!")
		} else {
			offsets[0][i] = offset
			offsets[1][i] = offset
		}
	}

	// Part 1
	fmt.Println(steps(offsets[0], func(x int) int { return x + 1 }))

	// Part 2
	fmt.Println(steps(offsets[1], func(x int) int {
		if x < 3 {
			return x + 1
		}
		return x - 1
	}))
}

func steps(offsets []int, mut func(x int) int) int {
	retval := 0
	inc := 0
	for i := 0; i < len(offsets) && i >= 0; i += inc {
		retval++
		inc = offsets[i]
		offsets[i] = mut(offsets[i])
	}
	return retval
}
