require "byebug"

module Slideable

  HORIZONTAL_DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def get_horizontal_dirs
    valid = []
    horizontal_dirs.each do |dir|
      valid += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end

    valid 
  end

  def get_diagonal_dirs 
    valid = []
    diagonal_dirs.each do |dir|
      valid += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end

    valid 
  end

  def moves 
    valid = []

    dir = move_dirs
    valid += get_horizontal_dirs unless dir == :diagonal
    valid += get_diagonal_dirs unless dir == :horizontal
    valid
  end

  private 
  def move_dirs 
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    valid = []
    row, col = pos

    while true 
      row += dx 
      col += dy
    
      break unless board.valid_pos?([row,col])
      break if board[[row,col]].color == color

      valid << [row , col]

      break if board[[row,col]].color != :none
    end
    valid
  end

end