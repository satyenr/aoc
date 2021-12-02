module Advent.Dive
(* 02. Dive! *)

type Direction =
    | Forward of int
    | Down of int
    | Up of int
    | Unknown

type Position = { X: int; Y: int; Aim: int }

(* Input *)
let parseMove (move: string) =
    let components = move.Split " " |> Array.toList
    let direction = components.[0]
    let magnitude = components.[1] |> int

    match direction with
    | "forward" -> Forward magnitude
    | "down" -> Down magnitude
    | "up" -> Up magnitude
    | _ -> Unknown

let parseInput lines = lines |> Seq.map parseMove

(* Part 1 *)
let move pos dir =
    match dir with
    | Forward n -> { pos with X = pos.X + n }
    | Down n -> { pos with Y = pos.Y + n }
    | Up n -> { pos with Y = pos.Y - n }
    | Unknown -> pos

(* Part 2 *)
let move' pos dir =
    match dir with
    | Forward n ->
        { X = pos.X + n
          Y = pos.Y + pos.Aim * n
          Aim = pos.Aim }
    | Down n -> { pos with Aim = pos.Aim + n }
    | Up n -> { pos with Aim = pos.Aim - n }
    | Unknown -> pos


let final moveFn dirs =
    let initialPos = { X = 0; Y = 0; Aim = 0 }

    let finalPos =
        dirs
        |> Seq.fold (fun pos dir -> moveFn pos dir) initialPos

    finalPos.X * finalPos.Y

let execute input =
    let directions = parseInput input
    let partOne = final move directions |> string
    let partTwo = final move' directions |> string
    (partOne, partTwo)

let problem =
    { Day = 2
      Year = "2021"
      Title = "Dive!"
      Solver = execute }
