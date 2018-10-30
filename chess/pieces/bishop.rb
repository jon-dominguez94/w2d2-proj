require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece
  include SlidingPiece
  
  def symbol
    '♗'.colorize(color)
  end
  
  protected
  
  def move_dirs
    diagonals
  end
end