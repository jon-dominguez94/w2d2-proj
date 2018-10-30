require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  
  attr_reader :board, :cursor
  
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end
  
  def play
    loop do
      render
      @cursor.get_input
    end
  end
  
  def render
    puts %x{clear}
    grid = board.grid.map.with_index do |row, i|
      row_output(row,i)
    end
    grid.each {|row| puts row.join}
  end
  
  def row_output(row,i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end
  
  def colors_for(i, j)
    if cursor.cursor_pos == [i,j] && cursor.selected
      bg = :light_green
    elsif cursor.cursor_pos == [i, j]
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_cyan
    else
      bg = :light_yellow
    end
    { background: bg }
  end
end

