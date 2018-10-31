class Piece
  attr_reader :board, :color
  attr_accessor :pos
  
  def initialize(pos, board, color)
    raise "Invalid color" unless [:black, :white].include?(color)
    raise "Invalid position" unless board.valid_pos?(pos)
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
  
  def valid_moves
    moves.reject {|move| move_into_check?(move)}
  end
  
  def move_into_check?(end_pos)
    duped_board = board.dup
    duped_board.move_piece!(pos, end_pos)
    duped_board.in_check?(color)
  end
  
end