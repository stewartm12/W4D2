require_relative "piece"
require_relative "slideable"

class Queen < Piece
  include Slideable
  
  def symbol
    color == :white ? "♕" : "♛"
  end

  private
  def move_dirs
    :both
  end

end