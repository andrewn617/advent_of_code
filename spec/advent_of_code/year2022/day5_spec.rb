require_relative "../../../lib/advent_of_code/year2022/day5"

RSpec.describe AdventOfCode::Year2022::Day5 do
  describe "part 1" do
    it "moves the crates and returns the top crate in each column" do
      input = <<-STRING
    [D]    
[N] [C]  
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
      STRING

      solution = AdventOfCode::Year2022::Day5.new(input)

      expect(solution.part1).to eq("CMZ")
    end
  end
end
