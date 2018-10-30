class Piece
  attr_reader :value
  
  def initialize(value)
    @value = value
  end
  
  def inspect
    @value
  end
  
end