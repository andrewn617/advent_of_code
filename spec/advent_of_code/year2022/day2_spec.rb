require_relative "../../../lib/advent_of_code/year2022/day2"

RSpec.describe AdventOfCode::Year2022::Day2 do
  let(:input) do
    <<~STRING
      A Y
      B X
      C Z
    STRING
  end

  describe "part 1" do
    it "calculates the correct score based on the opponent's play and the response" do
      solution = AdventOfCode::Year2022::Day2.new(input)

      expect(solution.part1).to eq(15)
    end
  end

  describe "part 2" do
    it "finds the winning play and calculates the correct score" do
      solution = AdventOfCode::Year2022::Day2.new(input)

      expect(solution.part2).to eq(12)
    end
  end
end
