require_relative "../../../lib/advent_of_code/year2022/day3"

RSpec.describe AdventOfCode::Year2022::Day3 do
  describe "part 1" do
    it "sums the priority of items that appear in both compartments" do
      input = <<~STRING
        vJrwpWtwJgWrhcsFMMfFFhFp
        jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
        PmmdzqPrVvPwwTWBwg
        wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
        ttgJtRGJQctTZtZT
        CrZsJsPPZsGzwwsLwLmpwMDw
      STRING
      solution = AdventOfCode::Year2022::Day3.new(input)

      expect(solution.part1).to eq(157)
    end
  end

  describe "part 2" do
    it "sums the priority of common items across 3 bags" do
      input = <<~STRING
        vJrwpWtwJgWrhcsFMMfFFhFp
        jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
        PmmdzqPrVvPwwTWBwg
        wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
        ttgJtRGJQctTZtZT
        CrZsJsPPZsGzwwsLwLmpwMDw
      STRING

      solution = AdventOfCode::Year2022::Day3.new(input)

      expect(solution.part2).to eq(70)
    end
  end
end
