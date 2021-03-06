module SteppingPiece
  
  def moves
    possible_moves = []
    move_dirs.each do |move|
      x,y = pos
      dx, dy = move
      new_pos = [x + dx, y + dy]
      
      next unless board.valid_pos?(new_pos)
      if board[new_pos].empty?
      # if board[new_pos].is_a?(NullPiece)
        possible_moves << new_pos
      elsif board[new_pos].color != color
        possible_moves << new_pos
      end
    end
    possible_moves
  end

  private 
  
  def move_dirs
    raise NotImplementedError
  end
end