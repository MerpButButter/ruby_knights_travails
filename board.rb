require_relative "styles"
require_relative "knight"
# Chess board with a display
class Board
  def initialize(knight)
    @board = Array.new(8) { Array.new(8, "   ") }
    @knight = knight
    place_piece([4, 4])
    display
  end

  def display
   puts(<<-HEREDOC
    #{''.mode('underscored')}
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
   )
  end

  def place_piece(position)
    @board[@knight.position[0] - 1][@knight.position[1] - 1] = "   "
    column = position[0] - 1
    row = position[1] - 1
    @knight.position = position

    @board[column][row] = " #{@knight.icon} "
    self
  end
  
  def div(type = "-")
    type * 33
  end
  
end

speed = 0.5
board = Board.new(Knight.new([4, 4]))
sleep(speed)
board.place_piece([5, 4]).display
sleep(speed)
board.place_piece([4, 8]).display
sleep(speed)
board.place_piece([2, 8]).display
sleep(speed)
board.place_piece([1, 8]).display
sleep(speed)
board.place_piece([2, 6]).display
sleep(speed)