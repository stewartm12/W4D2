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
        bg_color_values = { 0 => :light_blue, 1 => :light_black}
        row_to_print = ""
            (0..7).each do |col|
                bg_color = bg_color_values[(row+col)%2]
                if row == cursor.cursor_pos[0] && col == cursor.cursor_pos[1]
                    row_to_print += board[[row, col]].to_s.colorize( :background => :red)
                else 
                    row_to_print += board[[row, col]].to_s.colorize( :background => bg_color) 
                end
            end
            puts row_to_print 
    end 

end

