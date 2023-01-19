require_relative "board"
require_relative "node_tree"
require_relative "knight"

def knights_travails(start ,goal)
  knight = Knight.new(start)
  board = Board.new(knight)
  shortest_path = Tree.new(knight.position).shortest_path(goal, Knight::MOVES, board.method(:move_piece))
  
end

knights_travails([4, 4], [5, 4])