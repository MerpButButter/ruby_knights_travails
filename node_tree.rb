# rubocop:disable Style/Documentation

class Tree
  attr_reader :root
  
  class Node 
    attr_accessor :data, :parent
  
    def initialize(data, parent = nil)
      @data = data
      @parent = parent
    end
  end

  def initialize(root)
    @root = Node.new(root)
  end

  def level_order
    queue = [@root]
    queue.push(*yield(queue.shift)).compact! until queue.empty?
  end

  def shortest_path(goal, moves, method)
    shortest_path_node = nil
    made_moves = []
    level_order do |node|
      break if shortest_path_node

      if node.data == goal
        shortest_path_node = node
        break
      else
        moves.values.map do |move| 
          move = method.call(move, node.data)
          next if move.nil?
          next if made_moves.include?(move.map { |n| n + 1 })

          made_moves.push(move.map { |n| n + 1 })

          node = Node.new(move.map { |n| n + 1 }, node) 
          if node.data == goal
            shortest_path_node = node
            break  
          else
            node
          end    
        end
      end
    end
    short_path = []
    until shortest_path_node.nil?
      short_path << shortest_path_node.data 
      shortest_path_node = shortest_path_node.parent
    end
    short_path.reverse!.shift
    short_path 
  end

end

# rubocop:enable Style/Documentation