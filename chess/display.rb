require "colorize"
require_relative "board"
require_relative "cursor"

class Display

    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        board[cursor.cursor_pos].symbol.colorize( :background => :red)
        (0..7).each do |row|
            print_row(row)
        end
    end

    private

    def print_row(row)
        row_to_print = ""
        if row == cursor.cursor_pos[0]
            (0..7).each do |col|
                if col == cursor.cursor_pos[1]
                    row_to_print += board.rows[col].symbol.colorize( :background => :red)
                else 
                    row_to_print += board.rows[col] 
                end
                row_to_print += " " unless col == 7
            end
            puts row_to_print 
        else  
            puts board.rows[row].join(" ")
        end
    end 
end