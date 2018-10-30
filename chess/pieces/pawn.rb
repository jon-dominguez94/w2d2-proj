require_relative 'piece'

class Pawn < Piece
  
  def symbol
    '♟'.colorize(color)
  end
  
  def moves
    steps + attacks
    # debugger
  end
  
  def forward_move
    color == :white ? -1 : 1
  end
  
  def at_start?
    pos[0] == (color == :white ? 6 : 1)
  end
  
  def steps
    row, col = pos
    forward_one = [row + forward_move, col]
    return [] unless board.valid_pos?(forward_one) && board.empty?(forward_one)
    all_steps = [forward_one]
    forward_two = [row + 2 * forward_move, col]
    all_steps << forward_two if at_start? && board.empty?(forward_two) && 
                                board.valid_pos?(forward_two)
    all_steps
  end
  
  def attacks
    attack_pos = []
    row, col = pos
    [-1, 1].each do |j|
      # debugger
      diagonal = [row + forward_move, col + j]
      next unless board.valid_pos?(diagonal) && !board.empty?(diagonal)
      attack_pos << diagonal unless board[diagonal].color == color
    end
    attack_pos
  end
end