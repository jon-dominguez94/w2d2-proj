require_relative 'piece'
require_relative 'sliding_piece'

class King < Piece
  include SlidingPiece
  
  def symbol
    '♛'.colorize(color)
  end
  
  protected
  
  def move_dirs
    [
      [-1,-1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0,  1],
      [1, -1],
      [1,  0],
      [1,  1]
    ]
  end
end