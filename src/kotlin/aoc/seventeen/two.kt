package aoc.seventeen

private fun checksum(func: (List<Int>) -> Int, spreadsheet: List<List<Int>>) = spreadsheet.map(func).sum()

fun two(input: List<String>): Pair<String, String> {
    val spreadsheet = input.map { it.split("\\s+".toRegex()) }
            .map { row -> row.map { cell -> cell.toInt() }}

    val one = fun(row: List<Int>): Int {
        val max = row.max() ?: 0
        val min = row.min() ?: 0
        return max - min
    }

    val two = fun(row: List<Int>): Int {
        val sorted = row.sorted()
        return sorted.mapIndexedNotNull({ index, value ->
            val remaining = sorted.drop(index + 1)
            if (value != 0) remaining.find({ it % value == 0 })?.div(value) else null
        }).component1()
    }

    return Pair(
            checksum(one, spreadsheet).toString(),
            checksum(two, spreadsheet).toString()
    )
}