require_relative 'pieces'

class Board
  attr_reader :grid
  
  def initialize(confirmation)
    @grid = Array.new(8) {Array.new(8) }  
    populate(confirmation)
  end
  
  def empty?(pos)
    self[pos].empty?
  end
  
  def valid_pos?(pos)
    row,col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end
  
  def [](pos)
    raise 'Invalid pos' unless valid_pos?(pos)
    row, col = pos
    grid[row][col]
  end
  
  def []=(pos, val)
    raise 'Invalid pos' unless valid_pos?(pos)
    row,col = pos
    @grid[row][col] = val
  end
  
  def move_piece(start_pos, end_pos)
    raise ArgumentError, "No piece at this pos!" if empty?(start_pos)
    piece = self[start_pos] 
    raise "Piece cannot move there" unless piece.moves.include?(end_pos)
    move_piece!(start_pos, end_pos)
  end
  
  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = NullPiece.instance
    piece.pos = end_pos
    nil
  end
  
  def find_king(color)
    king = taken_pos.find {|piece| piece.color == color && piece.is_a?(King)}
    raise "No King!" unless king
    king
  end
  
  def in_check?(color)
    kings_pos = find_king(color).pos
    taken_pos.any? do |piece|
      p.color != color && p.moves.include?(kings_pos)
    end
  end
  
  def checkmate?(color)
  end
  
  def taken_pos
    grid.flatten.reject {|piece| piece.empty?}
  end
  
  def dup
    duped_board = Board.new(false)
    grid.each_with_index do |row, i|
      row.each_index do |j|
        pos = [i, j]
        og_piece = self[pos]
        if og_piece.is_a?(NullPiece)
          duped_board[pos] = NullPiece.instance
        else
          duped_board[pos] = og_piece.class.new(pos, duped_board, og_piece.color)
        end
      end
    end
    duped_board
  end
  
  private
  
  def populate(confirmation)
    return unless confirmation
    place_null_pieces
    [:black, :white].each do |color|
      place_non_pawns(color)
      place_pawns(color)
    end
    nil
  end
  
  def place_pawns(color)
    i = color == :white ? 6 : 1
    (0..7).each do |j|
      place_pos = [i,j]
      self[place_pos] = Pawn.new(place_pos, self, color)
    end
  end
  
  def place_non_pawns(color)
    pieces = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
    i = color == :white ? 7 : 0
    pieces.each_with_index do |piece, j|
      place_pos = [i,j]
      self[place_pos] = piece.new(place_pos, self, color)
    end
  end 
  
  def place_null_pieces
    grid.each_with_index do |row, i|
      next if [0, 1, 6, 7].include?(i)
      row.each_index do |j|
        pos = [i,j]
        self[pos] = NullPiece.instance
      end
    end
  end
  
  def inspect
  end
end









