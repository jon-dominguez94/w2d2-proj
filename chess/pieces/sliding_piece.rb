require 'byebug'

module SlidingPiece
  
  HORIZONTALS = [
    [0,  1],
    [1,  0],
    [0, -1],
    [-1, 0]
  ]
  
  DIAGONALS = [
    [-1,-1],
    [-1, 1],
    [1,  1],
    [1, -1],
  ]
  
  def horizontals
    HORIZONTALS
  end
  
  def diagonals
    DIAGONALS
  end
  
  def moves
    possible_moves = []
    move_dirs.each do |move|
      possible_moves += get_all_moves(move)
    end
    possible_moves
  end
  
  private

  def move_dirs
    raise NotImplementedError
  end
  
  def get_all_moves(move)
    possible_moves = []
    new_pos = pos
    loop do
      x, y = new_pos
      dx, dy = move
      new_pos = [x + dx, y + dy]
      break unless board.valid_pos?(new_pos)
      if board[new_pos].empty?
        possible_moves << new_pos
      else
        possible_moves << new_pos if board[new_pos].color != color
        break
      end
    end
    possible_moves
  end
    
end