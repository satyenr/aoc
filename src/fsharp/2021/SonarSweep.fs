module Advent.SonarSweep
(* 01. Sonar Sweep *)

let parseInput input = Seq.map int input

let gradient (depths: int list) =
    seq { 1 .. List.length depths - 1 }
    |> Seq.fold (fun count index -> if depths.[index] > depths.[index - 1] then count + 1 else count) 0

let gradient' (depths: int list) =
    seq { 0 .. List.length depths - 3 }
    |> Seq.map (fun i -> depths.[i] + depths.[i + 1] + depths.[i + 2])
    |> Seq.toList
    |> gradient

let execute input =
    let depths = parseInput input |> Seq.toList
    let partOne = gradient depths |> string
    let partTwo = gradient' depths |> string
    (partOne, partTwo)

let problem =
    { Day = 1
      Year = "2021"
      Title = "Sonar Sweep"
      Solver = execute }
