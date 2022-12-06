require_relative "../day"

module AdventOfCode
  module Year2022
    class Day3 < Day
      LETTER_VALUES = (("a".."z").to_a + ("A".."Z").to_a).map.with_index { |letter, i| [letter, i + 1] }.to_h

      def part1
        rucksacks.sum do |rucksack|
          rucksack
            .each_slice(rucksack.size / 2)
            .inject(:&)
            .sum(&LETTER_VALUES)
        end
      end

      def part2
        rucksacks
          .each_slice(3)
          .sum do |slice|
            slice
              .inject(:&)
              .sum(&LETTER_VALUES)
          end
      end

      private

      def rucksacks
        @rucksacks ||= input
          .split("\n")
          .map(&:chars)
      end
    end
  end
end
