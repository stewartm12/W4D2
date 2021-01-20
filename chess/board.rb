require "byebug"
require_relative "chesspieces"


class Board
  attr_reader :rows

  def initialize(fill_board? = true)
    @null = NullPiece.instance
    @rows = Array.new(8) { Array.new(8, null) }
    if fill_board?
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

  def in_check?(color)
    king_pos = nil 
    (0..7).each do |row|
      (0..7).each do |col|
        if self[[row, col]].is_a?(King) && self[[row, col]].color == color
          king_pos = [row, col]
          break
        end
      end
      break unless king_pos == nil
    end

    (0..7).each do |row|
      (0..7).each do |col|
        next if self[[row, col]] == null || self[[row, col]].color == color 
        return true if self[[row, col]].moves.include?(king_pos)
      end
    end

    false 
  end

  def checkmate?(color)
    (0..7).each do |row|
      (0..7).each do |col|
        next unless self[[row, col]].color == color 
        return false if self[[row, col]].valid_moves
      end
    end

    true
  end

  def dup
    new_board = Board.new(false)
    (0..7).each do |row|
        (0..7).each do |col|
          new_board[[row,col]] = self[[row,col]]
          new_board[[row,col]].board = new_board
        end
      end
  end
  private
  attr_reader :null 
end
