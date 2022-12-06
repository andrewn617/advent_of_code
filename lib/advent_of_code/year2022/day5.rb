require_relative "../day"

module AdventOfCode
  module Year2022
    class Day5 < Day
      def part1
        cargo = Cargo.new(stacks)

        instructions.each { |instruction| cargo.move!(instruction) }

        cargo.available_crates
      end

      private

      def stacks
        parsed_crate_data.map { |stack_data| Stack.new(stack_data) }
      end

      def parsed_crate_data
        @parsed_crate_data ||= initial_create_data.map do |line|
          line
            .chomp
            .chars
            .each_slice(4)
            .map { |slice| slice.grep(/[A-Z]/) }
        end.transpose.map { |column| column.reverse.flatten }
      end

      def initial_create_data
        @initial_create_data ||= input.split("\n\n").first.lines[0..-2]
      end

      def instructions
        raw_instructions.map { |raw_instruction| Instruction.from_string(raw_instruction) }
      end

      def raw_instructions
        @raw_instructions ||= input.split("\n\n").last.lines
      end

      class Cargo
        def initialize(stacks)
          @stacks = stacks
        end

        def available_crates
          @stacks.map(&:top).join
        end

        def move!(instruction)
          instruction.quantity.times do
            crate = stack(instruction.from).pick_up!

            stack(instruction.to).drop_off!(crate)
          end
        end

        def stack(number)
          @stacks[number - 1]
        end
      end

      class Stack
        attr_reader :crates

        def initialize(crates)
          @crates = crates
        end

        def top
          crates.last
        end

        def pick_up!
          @crates.pop
        end

        def drop_off!(crate)
          @crates.push(crate)
        end
      end

      class Instruction
        attr_reader :quantity, :from, :to

        def self.from_string(raw_instruction)
          quantity = raw_instruction.match(/move\s+(\S+)/)[1].to_i
          from = raw_instruction.match(/from\s+(\S+)/)[1].to_i
          to = raw_instruction.match(/to\s+(\S+)/)[1].to_i

          new(quantity, from, to)
        end

        def initialize(quantity, from, to)
          @quantity = quantity
          @from = from
          @to = to
        end
      end
    end
  end
end
