require_relative "piece"
require "singleton"

class NullPiece < Piece 
  include Singleton

  def initialize
    @color = :none
    @board = nil
    @pos = []
  end
end