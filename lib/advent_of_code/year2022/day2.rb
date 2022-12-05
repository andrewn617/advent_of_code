require_relative "../day"
require "singleton"

module AdventOfCode
  module Year2022
    class Day2 < Day
      class Shape
        include Singleton

        def self.find(code)
          case code
          when "A", "X"
            Rock.instance
          when "B", "Y"
            Paper.instance
          when "C", "Z"
            Scissors.instance
          end
        end
      end

      class Rock < Shape
        def points
          1
        end

        def defeats?(other)
          other == Scissors.instance
        end
      end

      class Paper < Shape
        def points
          2
        end

        def defeats?(other)
          other == Rock.instance
        end
      end

      class Scissors < Shape
        def points
          3
        end

        def defeats?(other)
          other == Paper.instance
        end
      end

      def part1
        opponent_and_response.inject(0) do |total, (opponent, response)|
          total += response.points
          total += 6 if response.defeats?(opponent)
          total += 3 if response == opponent
          total
        end
      end

      private

      def opponent_and_response
        rounds.map do |round|
          round.map { |code| Shape.find(code) }
        end
      end

      def rounds
        @rounds ||= input.lines.map { |line| line.chomp.split }
      end
    end
  end
end
