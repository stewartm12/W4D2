# require "byebug"

module Stepable

  def moves
    valid = []
    x, y = self.pos
    self.move_diffs.each do |move|
      new_pos = [x + move[0], y+move[1]]
      # next unless board.valid_pos?(new_pos)
      next unless new_pos[0].between?(0, 7) && new_pos[1].between?(0,7)

      # next if color == self.board[new_pos].color
      next if color == board[new_pos[0]][new_pos[1]].color

      valid << new_pos 
    end

    valid
  end

  private
  def move_diffs
  end

end