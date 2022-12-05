require_relative "../../../lib/advent_of_code/year2022/day1"

RSpec.describe AdventOfCode::Year2022::Day1 do
  let(:input) do
    <<~STRING
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    STRING
  end

  describe "part 1" do
    it "selects the Elf carrying the most calories" do
      day = AdventOfCode::Year2022::Day1.new(input)

      expect(day.part1).to eq(24000)
    end
  end

  describe "part 2" do
    it "sums the calories of the top 3 Elves" do
      day = AdventOfCode::Year2022::Day1.new(input)

      expect(day.part2).to eq(45000)
    end
  end
end
