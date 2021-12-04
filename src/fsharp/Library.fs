namespace Advent

type Problem =
    { Day: int
      Year: string
      Title: string
      Solver: string seq -> string * string }

module String =
    let split (delim: string) (str: string) = str.Split delim |> Array.toSeq

module Number =
    let decimal (binary: string) = System.Convert.ToInt32(binary, 2)
