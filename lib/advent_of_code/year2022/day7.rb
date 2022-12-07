require_relative "../day"

module AdventOfCode
  module Year2022
    class Day7 < Day
      def part1
        terminal = Terminal.new

        terminal.execute(input.lines.map(&:chomp))

        terminal.all_directories.map(&:size).select { |size| size < 100000 }.sum
      end

      def part2
        terminal = Terminal.new

        terminal.execute(input.lines.map(&:chomp))

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

        def execute(instruction_sequence)
          instruction_sequence.reverse!

          until instruction_sequence.empty?
            current = instruction_sequence.pop

            break unless current[0] == "$"

            _, instruction, content = current.split(" ")

            if instruction == "cd" && content == "/"
              @pwd = @root
            elsif instruction == "cd"
              @pwd = @pwd.cd(content)
            elsif instruction == "ls"
              contents = []
              loop do
                break if instruction_sequence.empty?
                break if instruction_sequence.last[0] == "$"

                contents << instruction_sequence.pop
              end
              @pwd.ls(contents)
            end
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

        def ls(contents)
          contents.each do |content|
            first, second = content.split(" ")
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
end
