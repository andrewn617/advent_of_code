require_relative "../../../lib/advent_of_code/year2022/day7"

RSpec.describe AdventOfCode::Year2022::Day7 do
  let(:input) do
    <<~STRING
        $ cd /
        $ ls
        dir a
        14848514 b.txt
        8504156 c.dat
        dir d
        $ cd a
        $ ls
        dir e
        29116 f
        2557 g
        62596 h.lst
        $ cd e
        $ ls
        584 i
        $ cd ..
        $ cd ..
        $ cd d
        $ ls
        4060174 j
        8033020 d.log
        5626152 d.ext
        7214296 k
    STRING
  end

  describe "part 1" do
    it "sums the size of the directories with a size less than 100000" do
      solution = AdventOfCode::Year2022::Day7.new(input)

      expect(solution.part1).to eq(95437)
    end
  end

  describe "part 2" do
    it "finds the smallest directory that can be deleted to make space for the new file" do
      solution = AdventOfCode::Year2022::Day7.new(input)

      expect(solution.part2).to eq(24933642)
    end
  end
end
