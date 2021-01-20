require_relative "piece"
require_relative "slideable"

class Rook < Piece
  include Slideable


  def symbol
    color == :white ? "♖" : "♜"
  end

  private
  def move_dirs
    :horizontal
  end

end