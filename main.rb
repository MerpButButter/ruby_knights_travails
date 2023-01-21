require_relative "board"
require_relative "node_tree"
require_relative "knight"

def knights_travails(start, goal)
  knight = Knight.new(start)
  board = Board.new(knight)
  shortest_path = Tree.new(knight.position).shortest_path(goal, Knight::MOVES, board.method(:move_piece))
  

  
  shortest_path_array(shortest_path).each do |position|
    sleep(1)
    board.place_piece(position.map { |n| n - 1 })
    board.display
  end
  puts("It took #{shortest_path.distance} moves.".color("orange"))
end

def shortest_path_array(node)
  short_path = []
  until node.nil?
    short_path.unshift(node.data)
    node = node.parent
  end
  short_path.shift
  short_path
end

knights_travails([1, 1], [8, 8])