require_relative "lib/advent_of_code"

class Solver
  attr_reader :year, :day

  def self.today
    today = Time.new

    new(today.year, today.day)
  end

  def initialize(year, day)
    @year = year
    @day = day
  end

  def part1
    solution.part1
  end

  def part2
    solution.part2
  end

  def solution
    solution_class.new(input)
  end

  def input
    File.read("data/#{year}/#{day}.txt")
  end

  def solution_class
    AdventOfCode.const_get("Year#{year}").const_get("Day#{day}")
  end
end
