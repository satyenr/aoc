module Advent.RocketEquation
(* The Tyranny of the Rocket Equation *)

let parse lines = lines |> Seq.map int
let totalFuel adder masses = Seq.sumBy adder masses
let fuel mass = max ((mass / 3) - 2) 0

let fuel' mass =
    mass
    |> Seq.unfold (fun m -> Some(m, fuel m))
    |> Seq.skip 1
    |> Seq.takeWhile (fun m -> m > 0)
    |> Seq.sum

let execute input =
    let masses = parse input
    let partOne = totalFuel fuel masses |> string
    let partTwo = totalFuel fuel' masses |> string
    (partOne, partTwo)

let problem =
    { Day = 1
      Year = "2019"
      Title = "The Tyranny of the Rocket Equation"
      Solver = execute }
