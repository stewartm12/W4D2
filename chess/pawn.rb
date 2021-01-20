require_relative "piece"


class Pawn < Piece


  def symbol
    color == :white ? "♙" : "♟︎"
  end

  def moves

  end

  private

  def at_start_row?
    return true if color == :black && pos[0] == 1
    return true if color == :white && pos[0] == 6
    false 
  end

  def forward_dir
    color == :black ? 1 : -1 
  end

  def forward_steps
    return [[1, 0], [2, 0]] if at_start_row
    [[1, 0]]
  end

  def side_attacks
    valid = []
    valid << [1, 1] if board[[pos[0] + 1, pos[1] + 1]].color != color
    valid << [1, -1] if board[[pos[0] + 1, pos[1] - 1]].color != color
    valid
  end

end