module Stepable

  def moves
    valid = []
    x, y = self.pos
    move_diffs.each do |move|
      new_pos = [[ x + move[0]], [y+move[1]]]
      next unless board.valid_pos?(new_pos)
      


    end
  end

  private
  def move_diffs
  end

end