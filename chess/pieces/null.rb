require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton
  
  attr_reader :color
  
  def initialize
    @color = :none
  end
    
  def symbol
    " "
  end
  
  def empty?
    true
  end
  
  def moves
    []
  end
end