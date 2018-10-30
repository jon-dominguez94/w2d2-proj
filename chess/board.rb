require_relative 'piece'

class Board
  
  def initialize
    @grid = Array.new(8) {Array.new(8) }  
    populate
  end
  
  def move_piece(start_pos, end_pos)
    raise ArgumentError, "No piece at this pos!" if self[start_pos].nil?
    raise ArgumentError, "Space is taken!" unless self[end_pos].nil?
    start_piece = self[start_pos] 
    self[end_pos] = start_piece
    self[start_pos] = nil
  end
  
  def self.valid_pos?(pos)
    row,col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end
  
  def render(position)
    grid.each_with_index do |row, i|
      output = "|"
      row.each_index do |j|
        pos = [i, j]
        if self[pos].nil?
          temp = "   \|"
          temp = temp.bg_red if pos == position # highlight if current_pos == cursor_pos
          output += temp
        else
          temp =  " #{self[pos].value} \|"
          temp = temp.bg_red if pos == position # highlight if current_pos == cursor_pos
          output += temp
        end
      end
      puts output 
      puts "----" * 8
    end
      
  end
  
  private
  attr_reader :grid
  
  def [](pos)
    row, col = pos
    grid[row][col]
  end
  
  def []=(pos, val)
    row,col = pos
    grid[row][col] = val
  end
  
  def populate
    grid.each_with_index do |row, i|
      if [0, 1, 6, 7].include?(i)
        row.each_index do |j|
          pos = [i,j]
          self[pos] = Piece.new("P")
        end
      end
    end
    nil #return nil bc we want to return grid for user to see
  end
end
