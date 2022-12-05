require_relative "../day"

module AdventOfCode
  module Year2022
    class Day1 < Day
      def part1
        calorie_counts.max
      end

      def part2
        calorie_counts.max(3).sum
      end

      private

      def calorie_counts
        @calorie_counts ||= input
          .split("\n\n")
          .map { |group| group.each_line.sum(&:to_i) }
      end
    end
  end
end
