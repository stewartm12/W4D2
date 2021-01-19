require_relative "piece"

class NullPiece < Piece 
  include Singleton

  def initialize
    @color = :none
    @board = nil
    @pos = []
  end
end