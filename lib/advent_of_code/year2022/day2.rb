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

        def defeats?(other)
          other == defeats
        end

        def defeated_by
          @defeated_by ||= shapes.detect { |shape| shape.defeats == self }
        end

        private

        def shapes
          @shapes ||= [Rock.instance, Paper.instance, Scissors.instance]
        end
      end

      class Rock < Shape
        def points
          1
        end

        def defeats
          Scissors.instance
        end
      end

      class Paper < Shape
        def points
          2
        end

        def defeats
          Rock.instance
        end
      end

      class Scissors < Shape
        def points
          3
        end

        def defeats
          Paper.instance
        end
      end

      RESULT_CODES = {
        "X" => :lose,
        "Y" => :draw,
        "Z" => :win
      }

      def part1
        opponent_and_response.sum do |opponent, response|
          points_for(opponent, response)
        end
      end

      def part2
        opponent_and_result.sum do |opponent, result_code|
          response = choose_response(opponent, result_code)
          points_for(opponent, response)
        end
      end

      private

      def points_for(opponent, response)
        points = response.points
        points += 6 if response.defeats?(opponent)
        points += 3 if response == opponent
        points
      end

      def choose_response(opponent, result_code)
        case result_code
        when :lose, "X"
          opponent.defeats
        when :draw, "Y"
          opponent
        when :win, "Z"
          opponent.defeated_by
        end
      end

      def opponent_and_response
        rounds.map do |round|
          round.map { |code| Shape.find(code) }
        end
      end

      def opponent_and_result
        rounds.map do |opponent_code, result_code|
          [Shape.find(opponent_code), result_code]
        end
      end

      def rounds
        @rounds ||= input.lines.map { |line| line.chomp.split }
      end
    end
  end
end
