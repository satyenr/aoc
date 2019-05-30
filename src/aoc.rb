#!/usr/bin/env ruby

require "set"

# Year: 2018
# Day: 01
class ChronalCalibration
  def initialize input
    @variations = input.lines.map(&:to_i)
  end

  def one
    @variations.reduce(0, :+)
  end

  def two
    freq = 0
    seen = Set.new
    @variations.cycle do |delta|
      freq += delta
      break if seen.include? freq
      seen << freq
    end
    freq
  end
end


$input = STDIN.read
solver = ChronalCalibration.new($input)
puts solver.one
puts solver.two
