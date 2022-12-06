require_relative "../day"

module AdventOfCode
  module Year2022
    class Day5 < Day
      def part1
        cargo = Cargo.new(stacks, mover: OneByOneMover.new)

        instructions.each { |instruction| cargo.move!(instruction) }

        cargo.top_crates
      end

      def part2
        cargo = Cargo.new(stacks, mover: GroupMover.new)

        instructions.each { |instruction| cargo.move!(instruction) }

        cargo.top_crates
      end

      private

      def stacks
        @stacks ||= initial_create_data.map do |line|
          line
            .chomp
            .chars
            .each_slice(4)
            .map { |slice| slice.grep(/[A-Z]/) }
        end.transpose.map { |column| column.reverse.flatten }
      end

      def initial_create_data
        input.split("\n\n").first.lines[0..-2]
      end

      def instructions
        @instructions ||= raw_instructions.map { |raw_instruction| Instruction.from_string(raw_instruction) }
      end

      def raw_instructions
        input.split("\n\n").last.lines
      end

      class Cargo
        def initialize(stacks, mover:)
          @stacks = stacks
          @mover = mover
        end

        def top_crates
          @stacks.map(&:last).join
        end

        def move!(instruction)
          @mover.move!(instruction.quantity, stack(instruction.from), stack(instruction.to))
        end

        def stack(number)
          @stacks[number - 1]
        end
      end

      class OneByOneMover
        def move!(quantity, from_stack, to_stack)
          quantity.times do
            crate = from_stack.pop

            to_stack.push(crate)
          end
        end
      end

      class GroupMover
        def move!(quantity, from_stack, to_stack)
          crates = from_stack.pop(quantity)

          to_stack.push(*crates)
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
