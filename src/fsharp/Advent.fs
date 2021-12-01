module Advent.Main

let read problem =
    let year = problem.Year
    let day = problem.Day
    let file = sprintf "inputs/%s/%02d.txt" year day
    System.IO.File.ReadLines file

let run problem = problem.Solver(read problem)

let write problem result =
    let year = problem.Year
    let day = problem.Day
    let title = problem.Title
    let first, second = result
    printfn "%s \t %02d \t %-40s \t %-10s \t %-10s" year day title first second

[<EntryPoint>]
let main argv =
    let problems =
        [ RocketEquation.problem
          ProgramAlarm.problem
          SonarSweep.problem ]
        |> List.sortBy (fun prob -> sprintf "%s %02d" prob.Year prob.Day)

    let results = problems |> List.map run

    List.zip problems results
    |> List.map (fun pr -> write (fst pr) (snd pr))
    |> ignore

    0
