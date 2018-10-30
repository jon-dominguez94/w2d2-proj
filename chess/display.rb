require 'colorize'
require_relative 'board.rb'
require_relative 'cursor.rb'

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

class String
  def bg_black;       "\e[40m#{self}\e[0m" end
  def bg_red;         "\e[41m#{self}\e[0m" end
  def bg_green;       "\e[42m#{self}\e[0m" end
  def bg_brown;       "\e[43m#{self}\e[0m" end
  def bg_blue;        "\e[44m#{self}\e[0m" end
  def bg_magenta;     "\e[45m#{self}\e[0m" end
  def bg_cyan;        "\e[46m#{self}\e[0m" end
  def bg_gray;        "\e[47m#{self}\e[0m" end
end