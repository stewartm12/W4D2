module Slideable

  HORIZONTAL_DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, 1], [-1, -1]]


  def horizontal_dirs
    valid = []
    HORIZONTAL_DIRS.each do |dir|
      valid += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end

    valid 
  end

  def diagonal_dirs 
    valid = []
    DIAGONAL_DIRS.each do |dir|
      valid += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end

    valid 
  end

  def moves 
    valid = []

    dir = move_dirs
    if dir == :horizontal || dir == :both
      valid += horizontal_dirs 
    end
    if dir == :diagonal || dir == :both
      valid += diagonal_dirs
    end
    
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

      break if !row.between?(0, 7) && !col.between?(0, 7)
      break if board[row][col].color == color


      valid << [row , col]

      break if board[row][col].color != :none
    end
  end

end