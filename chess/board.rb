require_relative 'pieces/pawn'
require_relative 'pieces/null'
require_relative 'pieces/king'

class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) {Array.new(8) }  
    populate
  end
  
  def inspect
  end
  
  def move_piece(start_pos, end_pos)
    raise ArgumentError, "No piece at this pos!" if self[start_pos].nil?
    raise ArgumentError, "Space is taken!" unless self[end_pos].nil?
    start_piece = self[start_pos] 
    self[end_pos] = start_piece
    self[start_pos] = nil
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
    
    grid.each_with_index do |row, i|
      row.each_index do |j|
        pos = [i,j]
        if [0, 1, 6, 7].include?(i)
          self[pos] = King.new(pos, self, :black)
        else
          self[pos] = NullPiece.instance
        end
      end
    end
    nil #return nil bc we want to return grid for user to see
  end
end
