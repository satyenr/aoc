open System
open System.IO

(* The Tyranny of the Rocket Equation -- https://adventofcode.com/2019/day/1 *)
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

 (* 1202 Program Alarm -- https://adventofcode.com/2019/day/2 *)
let getIntcodes (input: seq<string>) =
    (input |> Seq.head).Split "," |> Array.map int

let fixIntcodes (codes: int[]) =
    codes.[1] <- 12
    codes.[2] <- 2

let runIntcodes (codes: int[]) =
    let rec run pc =
        let opcode = codes.[pc]
        let fstOp = codes.[codes.[pc + 1]]
        let sndOp = codes.[codes.[pc + 2]]
        let resPos = codes.[pc + 3]
        let nextPC = pc + 4
        match opcode with
            | 99 -> Some codes.[0]
            | 1 -> codes.[resPos] <- fstOp + sndOp; run nextPC
            | 2 -> codes.[resPos] <- fstOp * sndOp; run nextPC
            | _ -> None
    run 0

let inputFile year day =
    let prefix = "inputs"
    [prefix; year; day] |> String.concat "/"

let readInput prefix year day =
    File.ReadLines([prefix; year; day;] |> String.concat "/")

[<EntryPoint>]
let main argv =
    (* Day 1 *)
    let input = File.ReadLines(inputFile "2019" "01.txt")
    let masses = getMasses input
    printfn "%-50s \t %d \t %d" "The Tyranny of the Rocket Equation" (totalFuel masses) (totalFuel' masses)

    (* Day 2 *)
    let input = File.ReadLines(inputFile "2019" "02.txt")
    let intcodes = getIntcodes input
    fixIntcodes intcodes
    match runIntcodes intcodes with
        | Some n -> printfn "%-50s \t %d" "1202 Program Alarm" n
        | None -> printfn "%-50s \t %s" "1202 Program Alarm" "Error"
    0
