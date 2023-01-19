require_relative "styles"
require_relative "knight"
# Chess board with a display
class Board
  def initialize(knight)
    @board = Array.new(8) { Array.new(8, "   ") }
    @knight = knight

    knight_column = knight.position[0] - 1
    knight_row = knight.position[1] - 1
    @board[knight_column][knight_row] = " #{knight.icon} "

    display
  end

  def display
    puts(<<-HEREDOC)

     #{div('_')}
   1 #{"|#{@board[0].join('|')}|".mode('underscored')}
   2 #{"|#{@board[1].join('|')}|".mode('underscored')}
   3 #{"|#{@board[2].join('|')}|".mode('underscored')}
   4 #{"|#{@board[3].join('|')}|".mode('underscored')}
   5 #{"|#{@board[4].join('|')}|".mode('underscored')}
   6 #{"|#{@board[5].join('|')}|".mode('underscored')}
   7 #{"|#{@board[6].join('|')}|".mode('underscored')}
   8 #{"|#{@board[7].join('|')}|".mode('underscored')}
       a   b   c   d   e   f   g   h

    HEREDOC
  end

  def place_piece(position)
    knight_column = @knight.position[0] 
    knight_row = @knight.position[1]

    @board[knight_column - 1][knight_row - 1] = "   "
    @knight.position = [position[0] + 1, position[1] + 1]
    

    @board[position[0]][position[1]] = " #{@knight.icon} "
    self
  end

  def move_piece(position, knight_position = @knight.position)
    return if position.nil? and !warn("Position #{position} isn't valid.")

    knight_column = knight_position[0] 
    knight_row = knight_position[1]

    column = (knight_column + position[0]) - 1
    row = (knight_row + position[1]) - 1
    
    return if column.negative? || row.negative?

    [column, row]    
  end

  def div(type = "-")
    type * 33
  end
  
end