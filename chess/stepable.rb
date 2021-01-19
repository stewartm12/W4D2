module Stepable

  def moves
    valid = []
    x, y = self.pos
    move_diffs.each do |move|
      new_pos = [[ x + move[0]], [y+move[1]]]
      next unless board.valid_pos?(new_pos)
      
      next if color == board[new_pos].color
      valid << new_pos 
    end

    valid
  end

  private
  def move_diffs
  end

end