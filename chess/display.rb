require "byebug"
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
        system("clear")
        # board[cursor.cursor_pos].symbol.colorize( :background => :red)
        (0..7).each do |row|
            print_row(row)
        end
    end

    def test

        while true
            render; sleep(1)
            board.move_piece([6,5], [5,5])
            render; sleep(1)
            board.move_piece([1, 4], [3,4])
            render; sleep(1)
            board.move_piece([6,6], [4,6])
            render
            p board.in_check?(:white); sleep(1)
            board.move_piece([0,3], [4,7])
            render; sleep(1)
            p board.in_check?(:white)
            cursor.get_input
        end
        
    end


    private

    def print_row(row)
        row_to_print = ""
        if row == cursor.cursor_pos[0]
            (0..7).each do |col|
                if col == cursor.cursor_pos[1]
                    row_to_print += board[[row, col]].symbol.colorize( :background => :red)
                else 
                    row_to_print += board[[row, col]].symbol 
                end
                row_to_print += " " unless col == 7
            end
            puts row_to_print 
        else  
            puts board.rows[row].join(" ")
        end
    end 
end

# b = Board.new
# d = Display.new(b)
# d.test