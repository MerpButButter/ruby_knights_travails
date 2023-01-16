require_relative "styles"
# Chess board with a display
class Board
  def initialize
    @board = Array.new(8) { Array.new(8, "   ") }
    @board[3][4] = " ♞ "
    puts(display)
  end

  def display
    <<-HEREDOC
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
  end

  
  
  def div(type = "-")
    type * 33
  end
  
end

Board.new