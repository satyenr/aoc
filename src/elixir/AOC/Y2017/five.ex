defmodule AOC.Y2017.Five do
  def answer(input) do
    offsets = 
      input
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)
      |> :array.from_list

    %{ 1 => steps(offsets, &(&1 + 1), 0, 0),
       2 => steps(offsets, &(if &1 < 3 do &1 + 1 else &1 - 1 end), 0, 0) }
  end

  defp steps(offsets, mut, cur, acc) do
    len = :array.size(offsets)
    cond do
      cur >= len -> acc
      cur < 0    -> acc
      true       -> 
        updated_offsets = :array.set(cur, mut.(:array.get(cur, offsets)), offsets)
        jump = cur + :array.get(cur, offsets)
        steps(updated_offsets, mut, jump, acc + 1)
    end
  end
end
