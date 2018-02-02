package aoc

import aoc.seventeen.one
import aoc.seventeen.two

fun seventeen(day: Int, input: List<String>) = when (day) {
    1 -> one(input)
    2 -> two(input)
    else -> throw Exception("Day $day not available")
}
