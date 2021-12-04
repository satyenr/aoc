module Advent.BinaryDiagnostic
(* 03. Binary Diagnostic *)

(* Most common bits *)
let mcb (report: string list) =
    let maxCount (counts: (char * int) list) =
        let max = counts |> Seq.maxBy snd |> snd

        counts
        |> List.filter (fun e -> snd e = max)
        |> List.sortBy fst
        |> List.last
        |> fst

    seq { 0 .. 11 }
    |> Seq.map (fun idx -> report |> Seq.map (fun entry -> entry.[idx]))
    |> Seq.map (fun idx -> idx |> Seq.countBy id)
    |> Seq.map Seq.toList
    |> Seq.map maxCount
    |> Seq.map string
    |> Seq.reduce (+)

(* Least common bits *)
let lcb (report: string list) =
    mcb report
    |> Seq.map (fun s -> if s = '1' then '0' else '1')
    |> Seq.map string
    |> Seq.reduce (+)

(* Power consumption *)
let powerConsumption (report: string list) =
    let gammaRate = mcb report |> Number.decimal
    let epsilonRate = lcb report |> Number.decimal

    gammaRate * epsilonRate

(* Life support rating *)
let lifeSupportRating (report: string list) =
    let rec filter (patternFn: string list -> string) (idx: int) (report': string list) =
        let pattern = patternFn report'

        match report' with
        | x :: [] -> x
        | _ -> filter patternFn (idx + 1) (List.filter (fun datum -> datum.[idx] = pattern.[idx]) report')

    let oxygenGenRating = filter mcb 0 report |> Number.decimal
    let carbonScrubberRating = filter lcb 0 report |> Number.decimal

    oxygenGenRating * carbonScrubberRating

let execute input =
    let report = Seq.toList input
    let partOne = powerConsumption report |> string
    let partTwo = lifeSupportRating report |> string
    (partOne, partTwo)

let problem =
    { Day = 3
      Year = "2021"
      Title = "Binary Diagnostic"
      Solver = execute }
