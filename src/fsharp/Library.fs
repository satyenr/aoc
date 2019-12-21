namespace Advent

type Solution<'a, 'b, 'c> =
    { Name: string
      Input: string seq -> 'a
      First: 'a -> 'b
      Second: 'a -> 'c }

module String =
    let split (delim: string) (str: string) = str.Split delim |> Array.toSeq
