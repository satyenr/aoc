package aoc.seventeen

fun sumDups(distance: Int, capcha: String): Int {
    return capcha.plus(capcha.substring(0, distance))
            .windowed(distance + 1)
            .filter { it.last() == it.first() }
            .map { it.first().toString().toInt() }
            .sum()
}

fun result(input: String): Pair<String, String> {
    val one = sumDups(1, input).toString()
    val two = sumDups(input.length/2, input).toString()
    return Pair(one, two)
}