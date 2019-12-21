module Advent.Main

let read year day =
    let file = sprintf "inputs/%d/%02d.txt" year day
    System.IO.File.ReadLines file

let run input solution =
    let lines = solution.Input input
    let fst = solution.First lines
    let snd = solution.Second lines
    (solution.Name, fst, snd)

let write output =
    let name, fst, snd = output
    printfn "%-40s \t %A \t %A" name fst snd

[<EntryPoint>]
let main argv =
    let solutions = [ RocketEquation.solution; ProgramAlarm.solution ]
    let input = read 2019
    let results = solutions |> List.mapi (fun idx soln -> run (input (idx + 1)) soln)
    results
    |> List.map write
    |> ignore
    0
