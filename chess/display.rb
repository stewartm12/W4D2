require "colorize"
require_relative "board"
require_relative "cursor"

class Display

    attr_reader :board, :cursor

    def initialize(board)
        @board = Board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        (0..7).each do |row|
            puts row.join(" ")
        end
    end

end