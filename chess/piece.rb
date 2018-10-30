class Piece
  attr_reader :value
  
  def initialize(value)
    @value = value
  end
  
  def inspect
    @value
  end
  
  def to_s
    " #{@value} "
  end
end