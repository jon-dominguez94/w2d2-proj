require_relative 'piece'

class Pawn < Piece
  
  def symbol
    '♟'.colorize(color)
  end
  
  def moves
    steps + attacks
  end
  
  def forward_move
    color == :white ? -1 : 1
  end
end