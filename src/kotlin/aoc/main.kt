@file:JvmName("Main")

package aoc

import java.io.File
import aoc.seventeen.result

fun main(args: Array<String>) {
    val input = File(args[0]).readText().trim()
    var output = result(input)
    println(output.first)
    println(output.second)
}