module Advent.ProgramAlarm
(* 1202 Program Alarm *)

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
                if run noun verb codes = target then
                    100 * noun + verb
    }
    |> Seq.head

let execute input =
    let codes = parse input
    let partOne = run 12 2 codes |> string
    let partTwo = calibrate 19690720 codes |> string
    (partOne, partTwo)

let problem =
    { Day = 2
      Year = "2019"
      Title = "1202 Program Alarm"
      Solver = execute }
