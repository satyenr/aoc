defmodule AOC.Y2017 do
  alias AOC.Y2017.Day01, as: One
  def answer(day, input) do
    case day do
      "1" -> One.answer(input)
      _   -> IO.puts "Day #{day} not available."; System.halt(1)
    end 
  end
end