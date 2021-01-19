class Piece
  attr_reader :color, :board 
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to.s

  end

  def empty?

  end

  def valid_moves

  end

  def pos=(val)
    self.pos = val
  end

  def Symbol

  end

  private 
  def move_into_check?(end_pos)

  end
end