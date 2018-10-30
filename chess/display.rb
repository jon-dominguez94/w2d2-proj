require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  
  attr_reader :board, :cursor
  
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end
  
  def inspect
  end
  
  def play
    loop do
      render
      @cursor.get_input
    end
  end
  
  def render
    puts %x{clear}
    rows = board.grid.map.with_index do |row, i|
      row_output(row,i)
    end
    rows.each {|row| puts row.join}
  end
  
  def row_output(row,i)
    row.map.with_index do |piece, j|
      bg_color = get_bg_color(i, j)
      piece.to_s.colorize(bg_color)
    end
  end
  
  def get_bg_color(i, j)
    if cursor.cursor_pos == [i,j]
      cursor.selected ? bg = :light_green : bg = :light_red
    elsif (i + j).odd?
      bg = :light_cyan
    else
      bg = :light_yellow
    end
    { background: bg }
  end
end

