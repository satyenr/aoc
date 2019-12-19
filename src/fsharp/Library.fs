namespace Advent

module String =
    let split (delim: string) (str: string) = str.Split delim |> Array.toSeq
