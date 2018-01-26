defmodule AOC.Y2017.One do
  def answer(input) do
    %{ 1 => sum_dups(1, input),
       2 => sum_dups(div(String.length(input), 2), input) }
  end

  defp ints(str) do
    str
    |> String.trim
    |> String.split("")
    |> Enum.slice(1 .. String.length(str))
  end

  defp sum_dups(distance, capcha) do
    capcha = ints(capcha)
    capcha
    |> Stream.cycle
    |> Stream.drop(distance)
    |> Stream.zip(capcha)
    |> Stream.filter(&(elem(&1, 0) == elem(&1, 1)))
    |> Stream.map(&elem(&1, 0))
    |> Enum.to_list
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum    
  end
end
