require_relative "chesspieces"


class Board

  def initialize
    null = NullPiece.instance
    @rows = Array.new(8) { Array.new(8, null) }
    (0..1).each do |x|
      (0..7).each do |y|
        @rows[x][y] = Pawn.new(:black, self, [x, y])
      end
    end

    (6..7).each do |x|
      (0..7).each do |y|
        @rows[x][y] = Queen.new(:white, self, [x, y])
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at that position" if self[start_pos] == nil
    raise "Piece cannot be moved to that position" unless valid_pos?(start_pos, end_pos) 

    self[start_pos], self[end_pos] = nil, self[start_pos]
    self[end_pos].pos = end_pos
  end

  def valid_pos?(pos)
    x, y = pos
    return x.between?(0, 7) && y.between?(0,7)
  end


  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @rows[x][y] = value
  end
end
