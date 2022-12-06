require_relative "../day"

module AdventOfCode
  module Year2022
    class Day6 < Day
      def part1
        input.chars.each_cons(4).with_index do |sequence, i|
          return i + 4 if sequence.uniq == sequence
        end
      end

      def part2
        input.chars.each_cons(14).with_index do |sequence, i|
          return i + 14 if sequence.uniq == sequence
        end
      end
    end
  end
end
