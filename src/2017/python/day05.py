#!/usr/bin/env python3

import sys


def steps(offsets, mut):
    steps = 0
    inc = 0
    ctr = 0
    while True:
        steps += 1
        inc = offsets[ctr]
        offsets[ctr] = mut(offsets[ctr])
        ctr += inc
        if ctr >= len(offsets) or ctr < 0:
            break

    return steps


def main():
    offsets = list(map(int, sys.stdin.readlines()))

    # Part 1
    print(steps(list(offsets), lambda x: x + 1))

    # Part 2
    print(steps(list(offsets), lambda x: x + 1 if x < 3 else x - 1))


if __name__ == '__main__':
    sys.exit(main())
