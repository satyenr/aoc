open System
open System.IO

module RocketEquation =
(*
 * The Tyranny of the Rocket Equation
 * https://adventofcode.com/2019/day/1
 *)

  let parse lines =
    lines |> Seq.map int

  let fuel mass =
    max ((mass / 3) - 2) 0

  let fuel' mass =
    let rec fuel'' acc m =
      let fm = fuel m
      match m with
        | 0 -> acc
        | _ -> fuel'' (acc + fm) (fm)
    fuel'' 0 mass

  let totalFuel adder masses =
    Seq.sumBy adder masses

  let results input =
    let masses = parse input
    let fst = totalFuel fuel masses
    let snd = totalFuel fuel' masses
    (fst, snd)

module ProgramAlarm =
(*
 * 1202 Program Alarm
 * https://adventofcode.com/2019/day/2
 *)

  let parse (lines: string seq) =
    (lines |> Seq.head).Split ","
    |> Seq.map int
    |> Seq.toList

  let run codes noun verb =
    let mem = List.toArray codes
    mem.[1] <- noun
    mem.[2] <- verb
    let rec run' pc =
      let opc = mem.[pc]
      let fst = mem.[pc + 1]
      let snd = mem.[pc + 2]
      let res = mem.[pc + 3]
      let nxt = pc + 4
      match opc with
        | 1 -> mem.[res] <- mem.[fst] + mem.[snd]; run' nxt
        | 2 -> mem.[res] <- mem.[fst] * mem.[snd]; run' nxt
        | _ -> mem.[0]
    run' 0

  let calibrate codes target =
    seq {
      for noun = 0 to 99 do
        for verb = 0 to 99 do
          if run codes noun verb = target then
            100 * noun + verb
    } |> Seq.head

  let results input =
    let codes = parse input
    let fst = run codes 12 2
    let snd = calibrate codes 19690720
    (fst, snd)

let inputFile year day =
  let prefix = "inputs"
  [prefix; year; day] |> String.concat "/"

let readInput prefix year day =
  File.ReadLines([prefix; year; day;] |> String.concat "/")

[<EntryPoint>]
let main argv =

  (* Day 1 *)
  let name = "The Tyranny of the Rocket Equation"
  let input = File.ReadLines(inputFile "2019" "01.txt")
  let output = RocketEquation.results input
  printfn "%-50s \t %d \t %d" name (fst output) (snd output)

  (* Day 2 *)
  let name = "1202 Program Alarm"
  let input = File.ReadLines(inputFile "2019" "02.txt")
  let output = ProgramAlarm.results input
  printfn "%-50s \t %d \t %d" name (fst output) (snd output)

  0
