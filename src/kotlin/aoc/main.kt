@file:JvmName("Main")

package aoc

import java.io.File

fun main(args: Array<String>) {
    val inputDir = args[0]
    val year = args[1]
    val day = args[2]
    val inputFile = "$inputDir/$year/$day"
    val input = File(inputFile).readLines()
    var output = result(day.toInt(), input)
    println(output.first)
    println(output.second)
}