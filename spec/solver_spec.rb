require_relative "../solver"

RSpec.describe Solver do
  it "can solve the puzzle for a given year and day" do
    solver = Solver.new(2022, 1)

    expect(solver.part1).to eq(68292)
    expect(solver.part2).to eq(203203)
  end
end
