require_relative "chesspieces"


class Board
  attr_reader :rows

  def initialize
    @null = NullPiece.instance
    @rows = Array.new(8) { Array.new(8, null) }
    color = :black
    [1, 6].each do |row|
      (0..7).each do |col|
        @rows[row][col] = Pawn.new(color, self, [row, col])
      end
      color = :white
    end

    color = :black
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    [0, 7].each do |row|
      (0..7).each do |col|
        @rows[row][col] = pieces[col].new(color, self, [row, col])
      end
      color = :white
    end
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at that position" if self[start_pos] == null
    raise "Piece cannot be moved to that position" unless self[start_pos].moves.include?(end_pos) 

    # old_piece = self[end_pos]
    self[start_pos], self[end_pos] = null, self[start_pos]
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

  private
  attr_reader :null 
end
