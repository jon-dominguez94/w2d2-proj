require_relative 'piece'
require_relative 'sliding_piece'

class Queen < Piece
  include SlidingPiece
  
  def symbol
    '♚'.colorize(color)
  end
  
  protected
  
  def move_dirs
    horizontals + diagonals
  end
end