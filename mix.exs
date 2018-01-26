defmodule AOC.MixProject do
  use Mix.Project

  def project do
    [
      app: :aoc,
      version: "0.1.0",
      elixir: "~> 1.6",
      escript: escript(),
      start_permanent: Mix.env() == :prod,
      elixirc_paths: ["src/elixir"],
      deps: deps()
    ]
  end

  def escript do
    cwd = System.cwd()
    bindir = System.get_env("AOC_BINDIR") || "#{cwd}/bin"
    [
      main_module: AOC,
      name: "aoc-elixir",
      path: "#{bindir}/aoc-elixir"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end
end
