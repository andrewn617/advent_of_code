require_relative "../day"

module AdventOfCode
  module Year2022
    class Day2 < Day
      SHAPE_CODES = {
        "A" => :rock,
        "B" => :paper,
        "C" => :scissors,
        "X" => :rock,
        "Y" => :paper,
        "Z" => :scissors
      }.freeze

      DEFEATED_BY = {
        rock: :scissors,
        scissors: :paper,
        paper: :rock
      }.freeze

      SHAPE_VALUES = { rock: 1, paper: 2, scissors: 3 }.freeze

      def part1
        rounds.inject(0) do |total, (opponent, response)|
          total += SHAPE_VALUES[response]
          total += result_points(opponent, response)
          total
        end
      end

      private

      def result_points(opponent_shape, response_shape)
        if DEFEATED_BY[response_shape] == opponent_shape
          6
        elsif DEFEATED_BY[opponent_shape] == response_shape
          0
        else
          3
        end
      end

      def rounds
        @rounds ||= input.lines.map { |line| line.chomp.split.map(&SHAPE_CODES) }
      end
    end
  end
end
