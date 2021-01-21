require_relative "cursor"

class Player
    attr_reader :color

    def initialize(color, display)
        @color, @display = color, display
    end

    private
        attr_accessor :display
end

class HumanPlayer < Player

    def make_move
        begin
            start_pos = nil
            while start_pos == nil
                start_pos = display.cursor.get_input
                display.render
            end

            end_pos = nil
            while end_pos == nil
                end_pos = display.cursor.get_input
                display.render
            end

            #If user selects the same space each time, get new move
            # if start_pos != end_pos
            display.board.move_piece(start_pos, end_pos)
        rescue RuntimeError => e
            puts e
            retry
        end
    end

end