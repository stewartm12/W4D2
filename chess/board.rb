require_relative "piece"
require_relative "king"
require_relative "knight"
require_relative "nullpiece"


class Board

  def initialize
    null = NullPiece.instance
    @board = Array.new(8) { Array.new(8, null) }
    (0..1).each do |x|
      (0..7).each do |y|
        @board[x][y] = King.new(:black, @board, [x, y])
      end
    end

    (6..7).each do |x|
      (0..7).each do |y|
        @board[x][y] = Knight.new(:white, @board, [x, y])
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at that position" if self[start_pos] == nil
    raise "Piece cannot be moved to that position" unless valid_pos?(start_pos, end_pos) 

    self[start_pos], self[end_pos] = nil, self[start_pos]
    self[end_pos].pos = end_pos
  end

  def valid_pos?(start_pos, end_pos)
    x, y = end_pos
    return x.between?(0, 7) && y.between?(0,7)
  end


  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @board[x][y] = value
  end
end
