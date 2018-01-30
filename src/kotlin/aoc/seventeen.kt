package aoc

import aoc.seventeen.one

fun result(day: Int, input: String) = when (day) {
    1  -> one(input)
    else -> throw Exception("Day $day not available")
}