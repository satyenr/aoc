@file:JvmName("Main")

package aoc

import java.io.File

fun main(args: Array<String>) {
    val input = File(args[0]).readText().trim()
    var output = result(1, input)
    println(output.first)
    println(output.second)
}