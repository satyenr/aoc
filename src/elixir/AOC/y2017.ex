defmodule AOC.Y2017 do
  alias AOC.Y2017.One, as: One

  def answer(day, input) do
    case day do
      "1" -> One.answer(input)
      _   -> raise ArgumentError, message: "Day #{day} not available"
    end 
  end
end