require_relative 'piece'

class Pawn < Piece
  
  def symbol
    '♟'.colorize(color)
  end
  
  def moves
    []
  end
end