package aoc.seventeen

private fun sumDups(distance: Int, capcha: String) =
        capcha.plus(capcha.substring(0, distance))
                .splitToSequence("")
                .windowed(distance + 1)
                .filter { it.last() == it.first() }
                .map { it.first().toString().toInt() }
                .sum()

fun one(input: List<String>): Pair<String, String> {
    val capcha = input.first()
    val one = sumDups(1, capcha).toString()
    val two = sumDups(capcha.length/2, capcha).toString()
    return Pair(one, two)
}