require_relative "board"
require_relative "node_tree"
require_relative "knight"

def knights_travails(start, goal)
  knight = Knight.new(start)
  board = Board.new(knight)
  shortest_path = Tree.new(knight.position).shortest_path(goal, Knight::MOVES, board.method(:move_piece))
  
  shortest_path.each do |position|
    sleep(1)
    board.place_piece(position.map { |n| n - 1 })
    board.display
  end
  puts("It took #{shortest_path.length} moves.".color("orange"))
end

knights_travails([4, 4], [6, 4])