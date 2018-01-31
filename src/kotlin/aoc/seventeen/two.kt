package aoc.seventeen

private fun checksum(func: (List<Int>) -> Int, spreadsheet: List<List<Int>>) = spreadsheet.map(func).sum()

fun two(input: List<String>): Pair<String, String> {
    val spreadsheet = input.map { it.split("\\s+".toRegex()) }
            .map { row -> row.map { cell -> cell.toInt() }}

    var one = fun(row: List<Int>): Int {
        val max = row.max() ?: 0
        val min = row.min() ?: 0
        return max - min
    }

    var two = fun(row: List<Int>): Int {
        return 0
    }

    return Pair(
            checksum(one, spreadsheet).toString(),
            checksum(two, spreadsheet).toString()
    )
}