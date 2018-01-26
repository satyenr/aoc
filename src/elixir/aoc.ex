defmodule AOC do
  alias AOC.Y2017, as: Y2017

  def main(args) do
    args |> parse |> process
  end

  defp parse(args) do
    opts = OptionParser.parse(args)
    case opts do
      {[year: year, day: day], _, _} -> [year, day]
      {[help: true]}                 -> :help
      _                              -> :help
    end
  end

  def process(:help) do
    IO.puts """
    Advent of Code (Elixir)

    Usage: aoc-ex (--year YEAR) (-d|--day DAY)

    Available options:
      --help                Show this help text
      --year YEAR           Advent of Code year (default: 2017)
      --day DAY             AoC day for the given year
    """
  end

  def process(options) do
    [year, day] = options

    start = System.system_time(:microsecond)
    input = input()
    ready = System.system_time(:microsecond)
    ans = case year do
      "2017" -> Y2017.answer(day, input)
      _      -> IO.puts "Year #{year} not available."; System.halt(0)
    end
    final = System.system_time(:microsecond)

    IO.puts "answer:"
    IO.puts "  part-one: #{ans[1]}"
    IO.puts "  part-two: #{ans[2]}"

    IO.puts "time:"
    IO.puts "  input: #{(ready - start)} us"
    IO.puts "  process: #{(final - ready)} us"
    IO.puts "  total: #{(final - start)} us"
  end

  def input() do
    IO.read(:stdio, :all) |> String.trim
  end
end