namespace Advent

type Problem =
    { Day: int
      Year: string
      Title: string
      Solver: string seq -> string * string }

module String =
    let split (delim: string) (str: string) = str.Split delim |> Array.toSeq
