require_relative "piece"


class Pawn < Piece


  def symbol
    color == :white ? "♙" : "♟︎"
  end

  def moves
    valid = []
    valid += forward_steps
    valid += side_attacks
    valid
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
    valid = []
    new_pos = [pos[0]+forward_dir, pos[1]]
    valid << new_pos if board.valid_pos?(new_pos) && board[new_pos].color == :none
    if at_start_row?
        new_pos = [pos[0]+2*forward_dir, pos[1]]
        valid << new_pos if board.valid_pos?(new_pos) && board[new_pos].color == :none
    end
    valid
  end

  def side_attacks
    valid = []
    opposing_color = (color == :white ? :black : :white)
    new_pos = [pos[0]+forward_dir, pos[1]+1]
    valid << new_pos if board.valid_pos?(new_pos) && board[new_pos].color == opposing_color
    new_pos = [pos[0]+forward_dir, pos[1]-1]
    valid << new_pos if board.valid_pos?(new_pos) && board[new_pos].color == opposing_color
    valid
  end

end