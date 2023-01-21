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
    @queue.push(*yield(@queue.shift)).compact! until @queue.empty?
  end

  def shortest_path(goal, moves, method)
    shortest_path_length = 1000
    made_moves = [@root.data]
    shortest_paths = []
    queue = [@root]

    until queue.empty? 
      node = queue.shift
      next if shortest_path_length < move_length(node) 
      
      if node.data == goal
        shortest_path_length = move_length(node) if shortest_path_length > move_length(node)
        shortest_paths.push(node)
        next
      else
        moves.values.map do |move| 
          move = method.call(move, node.data)
          next if move.nil?
          
          p(queue.map {|q_node| q_node.data})
          move.map! { |n| n + 1 }
          next if made_moves.include?(move)

          made_moves.push(move)

          node = Node.new(move, node) 
          if node.data == goal
            shortest_path_length = move_length(node) if shortest_path_length > move_length(node)
            shortest_paths.push(node)
            next  
          else
            queue.push(node)
          end    
        end
      end
    end
    p shortest_paths
  end

  def move_length(node)
    length = 0
    until node.nil?
      length += 1
      node = node.parent
    end
    length
  end

end

# rubocop:enable Style/Documentation