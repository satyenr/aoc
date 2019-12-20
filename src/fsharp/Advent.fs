namespace Advent

open System.IO

type Solution<'a, 'b, 'c> =
    { Name: string
      Input: string seq -> 'a
      First: 'a -> 'b
      Second: 'a -> 'c }

(* The Tyranny of the Rocket Equation *)
module RocketEquation =
    let name = "The Tyranny of the Rocket Equation"

    let parse lines = lines |> Seq.map int

    let fuel mass = max ((mass / 3) - 2) 0

    let fuel' mass =
        mass
        |> Seq.unfold (fun m -> Some(m, fuel m))
        |> Seq.skip 1
        |> Seq.takeWhile (fun m -> m > 0)
        |> Seq.sum

    let totalFuel adder masses = Seq.sumBy adder masses

    let solution =
        { Name = name
          Input = parse
          First = totalFuel fuel
          Second = totalFuel fuel' }

(* 1202 Program Alarm *)
module ProgramAlarm =
    let name = "1202 Program Alarm"

    let parse lines =
        lines
        |> Seq.head
        |> String.split ","
        |> Seq.map int

    let run noun verb codes =
        let mem = Seq.toArray codes
        mem.[1] <- noun
        mem.[2] <- verb
        let rec run' pc =
            let opc = mem.[pc]
            let fst = mem.[pc + 1]
            let snd = mem.[pc + 2]
            let res = mem.[pc + 3]
            let nxt = pc + 4
            match opc with
            | 1 ->
                mem.[res] <- mem.[fst] + mem.[snd]
                run' nxt
            | 2 ->
                mem.[res] <- mem.[fst] * mem.[snd]
                run' nxt
            | _ -> mem.[0]
        run' 0

    let calibrate target codes =
        seq {
            for noun = 0 to 99 do
                for verb = 0 to 99 do
                    if run noun verb codes = target then 100 * noun + verb
        }
        |> Seq.head

    let solution =
        { Name = name
          Input = parse
          First = run 12 2
          Second = calibrate 19690720 }

module Main =
    let read year day =
        let file = sprintf "inputs/%d/%02d.txt" year day
        File.ReadLines file

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
