module Advent.RocketEquation
(* The Tyranny of the Rocket Equation *)

let name = "The Tyranny of the Rocket Equation"
let parse lines = lines |> Seq.map int
let totalFuel adder masses = Seq.sumBy adder masses
let fuel mass = max ((mass / 3) - 2) 0

let fuel' mass =
    mass
    |> Seq.unfold (fun m -> Some(m, fuel m))
    |> Seq.skip 1
    |> Seq.takeWhile (fun m -> m > 0)
    |> Seq.sum

let solution =
    { Name = name
      Input = parse
      First = totalFuel fuel
      Second = totalFuel fuel' }