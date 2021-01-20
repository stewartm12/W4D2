class Piece
  attr_reader :color, :pos
  attr_accessor :board 

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    symbol
  end

  def empty?

  end

  def valid_moves
    valid = []
    moves.each { |pos| valid << pos unless move_into_check?(pos) }
    valid 
  end

  def pos=(val)
    @pos = val
  end

  def symbol

  end

  def inspect
    "#{self.class}, #{color}, pos = #{pos}"
  end

  private 
  def move_into_check?(end_pos)
    new_board = board.dup
    new_board.move_piece!(pos, end_pos)
    return true if new_board.in_check?(color)
    false 
  end
end