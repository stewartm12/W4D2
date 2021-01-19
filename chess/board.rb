require_relative "piece"

class Board

  def initialize
    @board = Array.new(8) { Array.new(8, nil) }
    (0..1).each do |x|
      (0..7).each do |y|
        @board[x][y] = Piece.new(:black, @board, [x, y])
      end
    end

    (6..7).each do |x|
      (0..7).each do |y|
        @board[x][y] = Piece.new(:white, @board, [x, y])
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at that position" if self[pos] == nil
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end
end
