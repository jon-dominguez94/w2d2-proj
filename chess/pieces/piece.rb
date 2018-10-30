class Piece
  attr_reader :board, :color
  attr_accessor :pos
  
  def initialize(pos, board, color)
    @pos, @board, @color = pos, board, color
  end
  
  def to_s
    " #{symbol} "
  end
  
  def inspect
    " #{symbol} "
  end
  
  def empty?
    false
  end
  
  def symbol
    raise NotImplementedError
  end
  
  def valid_moves
    moves
  end
  
end