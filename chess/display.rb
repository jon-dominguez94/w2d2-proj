require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  
  def initialize(board)
    @cursor_pos = Cursor.new([0,0], board)
    @board = board
  end
  
  def render
    loop do
      @board.render(@cursor_pos)
      @cursor_pos.get_input
    end
  end
end

