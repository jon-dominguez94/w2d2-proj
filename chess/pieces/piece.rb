class Piece
  attr_reader :value, :color
  attr_accessor :board
  
  def initialize(pos, board, color)
    @pos, @board, @color = pos, board, color
  end
  
  def to_s
    " #{symbol} "
  end
  
  def empty?
    false
  end
  
  def symbol
    raise NotImplementedError
  end
  
  def moves
  end
end