require_relative "../../../lib/advent_of_code/year2022/day6"

RSpec.describe AdventOfCode::Year2022::Day6 do
  describe "part 1" do
    it "detects the first sequence of four different characters and returns the location of the next character" do
      solution = AdventOfCode::Year2022::Day6.new("bvwbjplbgvbhsrlpgdmjqwftvncz")

      expect(solution.part1).to eq(5)
    end
  end

  describe "part 2" do
    it "detects the first sequence of 14 different characters and returns the location of the next character" do
      solution = AdventOfCode::Year2022::Day6.new("mjqjpqmgbljsphdztnvjfqwrcgsmlb")

      expect(solution.part2).to eq(19)
    end
  end
end
