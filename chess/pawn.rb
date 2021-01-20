require_relative "piece"


class Pawn < Piece


  def symbol
    color == :white ? "♙" : "♟︎"
  end

  private
  def move_dirs
    :horizontal
  end

end