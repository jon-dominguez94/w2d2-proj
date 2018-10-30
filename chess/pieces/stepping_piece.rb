module SteppingPiece
  
  def moves
    possible_moves = []
    move_dirs.each do |move|
      x,y = pos
      dx, dy = move
      new_pos = [x + dx, y + dy]
      
      next unless board.valid_pos?(new_pos)
      if board.empty?(new_pos)
        valid_moves << new_pos
      elsif board[new_pos].color != color
        valid_moves << new_pos
      end
    end
    possible_moves
  end

  def move_dirs
    raise NotImplementedError
  end
end