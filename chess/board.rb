require_relative 'pieces'

class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) {Array.new(8) }  
    populate
  end
  
  def inspect
  end
  
  def empty?(pos)
    self[pos].empty?
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
  
  private
  
  def populate
    
    # grid.each_with_index do |row, i|
    #   row.each_index do |j|
    #     pos = [i,j]
    #     if [0, 1, 6, 7].include?(i)
    #       self[pos] = Knight.new(pos, self, :black)
    #     else
    #       self[pos] = NullPiece.instance
    #     end
    #   end
    # end
    # nil #return nil bc we don't want to return grid for user to see
    [:black, :white].each do |color|
      place_non_pawns(color)
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
end
