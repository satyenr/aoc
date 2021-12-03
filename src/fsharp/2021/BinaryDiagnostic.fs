module Advent.BinaryDiagnostic
(* 03. Binary Diagnostic *)

open System

let powerConsumption (report: string list) =
    let gammaBits =
        seq { 0 .. 11 }
        |> Seq.map (fun idx -> report |> Seq.map (fun entry -> entry.[idx]))
        |> Seq.map (fun idx -> idx |> Seq.countBy id)
        |> Seq.map (Seq.maxBy snd)
        |> Seq.map fst
        |> Seq.map string
        |> Seq.reduce (+)

    let epsilonBits =
        gammaBits
        |> Seq.map (fun s -> if s = '1' then '0' else '1')
        |> Seq.map string
        |> Seq.reduce (+)

    let gammaRate = Convert.ToInt32(gammaBits, 2)
    let epsilonrate = Convert.ToInt32(epsilonBits, 2)

    gammaRate * epsilonrate

let execute input =
    let report = Seq.toList input
    let partOne = powerConsumption report |> string
    let partTwo = ""
    (partOne, partTwo)

let problem =
    { Day = 3
      Year = "2021"
      Title = "Binary Diagnostic"
      Solver = execute }
