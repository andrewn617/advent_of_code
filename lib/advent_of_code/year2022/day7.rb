require_relative "../day"

module AdventOfCode
  module Year2022
    class Day7 < Day
      def part1
        terminal = Terminal.new

        input.lines.map(&:chomp).each { |instruction| terminal.execute(instruction) }

        terminal.all_directories.map(&:size).select { |size| size < 100000 }.sum
      end

      def part2
        terminal = Terminal.new

        input.lines.map(&:chomp).each { |instruction| terminal.execute(instruction) }

        needed_space = 30000000 - terminal.free_disk_space

        terminal.all_directories.map(&:size).select { |size| size > needed_space }.min
      end

      class Terminal
        attr_reader :root, :pwd

        TOTAL_DISK_SPACE = 70000000

        def initialize
          @root = Directory.new
          @pwd = @root
        end

        def all_directories
          @root.list_directories.flatten
        end

        def free_disk_space
          TOTAL_DISK_SPACE - @root.size
        end

        def execute(instruction)
          if instruction == "$ cd /"
            @pwd = @root
          elsif instruction[0..3] == "$ cd"
            *_, directory = instruction.split
            @pwd = @pwd.cd(directory)
          elsif instruction[0..3] != "$ ls"
            @pwd.add(instruction)
          end
        end
      end

      class Directory
        def initialize(parent = nil)
          @parent = parent
          @subdirectories = {}
          @files = {}
        end

        def size
          @files.values.sum + @subdirectories.values.sum(&:size)
        end

        def list_directories
          [self, @subdirectories.values.map(&:list_directories)]
        end

        def cd(directory)
          if directory == ".."
            @parent
          else
            @subdirectories[directory]
          end
        end

        def add(content)
          first, second = content.split
          if first == "dir"
            @subdirectories[second] = Directory.new(parent = self)
          else
            @files[second] = first.to_i
          end
        end
      end
    end
  end
end
