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
    it "works" do
      solution = AdventOfCode::Year2022::Day2.new(input)

      expect(solution.part1).to eq(15)
    end
  end
end
