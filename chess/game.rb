require_relative "board"
require_relative "display"
require_relative "player"

class Game

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @players = {:white => HumanPlayer.new(:white, @display), :black => HumanPlayer.new(:black, @display)}
        @current_player = @players[:white]
    end

    def play
        loop do
            display.render
            notify_players
            current_player.make_move
            swap_turn!
        end
    end

    private
    def notify_players
        puts "It is #{@current_player.color}'s turn."
    end

    def swap_turn!
        self.current_player = current_player.color == :white ? players[:black] : players[:white]
    end

    private
        attr_reader :display, :players
        attr_accessor :current_player
end

g= Game.new
g.play