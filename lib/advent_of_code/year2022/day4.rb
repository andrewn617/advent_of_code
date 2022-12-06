require_relative "../day"
require "set"

module AdventOfCode
  module Year2022
    class Day4 < Day
      def part1
        assignment_pairs.count do |assignment1, assignment2|
          assignment1 <= assignment2 || assignment2 <= assignment1
        end
      end

      private

      def assignment_pairs
        input.lines.map do |assignment_pair|
          assignment_pair.split(",").map do |assignment|
            first, last = assignment.split("-")
            first.to_i.upto(last.to_i).to_set
          end
        end
      end
    end
  end
end
