require_relative "../../../lib/advent_of_code/year2022/day4"

RSpec.describe AdventOfCode::Year2022::Day4 do
  describe "part 1" do
    it "counts the number of pairs where one assignment contains the others" do
      input = <<~STRING
        2-4,6-8
        2-3,4-5
        5-7,7-9
        2-8,3-7
        6-6,4-6
        2-6,4-8
      STRING

      solution = AdventOfCode::Year2022::Day4.new(input)

      expect(solution.part1).to eq(2)
    end

    it "can handle pairs with double digit numbers" do
      input = <<~STRING
        2-4,1-11
      STRING

      solution = AdventOfCode::Year2022::Day4.new(input)

      expect(solution.part1).to eq(1)
    end

    it "counts improper subsets" do
      input = <<~STRING
        2-4,2-4
      STRING

      solution = AdventOfCode::Year2022::Day4.new(input)

      expect(solution.part1).to eq(1)
    end
  end

  describe "part 2" do
    it "counts the number of pairs with overlapping segments" do
      input = <<~STRING
        2-4,6-8
        2-3,4-5
        5-7,7-9
        2-8,3-7
        6-6,4-6
        2-6,4-8
      STRING

      solution = AdventOfCode::Year2022::Day4.new(input)

      expect(solution.part2).to eq(4)
    end
  end
end
