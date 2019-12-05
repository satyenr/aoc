open System
open System.IO

(*
    The Tyranny of the Rocket Equation
    https://adventofcode.com/2019/day/1
*)
let getMasses input =
    input |> Seq.map int

let fuel mass =
    max ((mass / 3) - 2) 0

let totalFuel masses =
    Seq.sumBy fuel masses

let fuel' mass =
    let rec fuel'' acc m =
        let fm = fuel m
        match m with
            | 0 -> acc
            | _ -> fuel'' (acc + fm) (fm)
    fuel'' 0 mass

let totalFuel' masses =
    Seq.sumBy fuel' masses

[<EntryPoint>]
let main argv =
    let input = File.ReadLines(argv.[0])
    let masses = getMasses input
    printfn "The Tyranny of the Rocket Equation \t %d \t %d" (totalFuel masses) (totalFuel' masses)
    0
