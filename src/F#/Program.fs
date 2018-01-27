open System
open System.IO

module One =
    let sumDups dist capcha = 
        Seq.append capcha capcha
        |> Seq.windowed (dist + 1)
        |> Seq.take (Seq.length capcha)
        |> Seq.filter (fun xs -> Seq.head xs = Seq.last xs)
        |> Seq.sumBy (Seq.head >> int)


[<EntryPoint>]
let main argv =
    let input = Console.ReadLine()
    let answerOne = One.sumDups 1 input
    let answerTwo = One.sumDups ((String.length input)/2) input
    printfn "%A\n" answerOne
    printfn "%A\n" answerTwo
    0