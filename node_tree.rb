# rubocop:disable Style/Documentation

class Tree
  attr_reader :root
  
  class Node 
    attr_accessor :data, :parent, :distance
  
    def initialize(data, distance , parent = nil)
      @data = data
      @parent = parent
      @distance = distance
    end
  end

  def initialize(root)
    @root = Node.new(root, 0)
  end

  def shortest_path(goal, moves, method)
    queue = [@root]
    visited = [@root.data.map { |n| n - 1 }]

    until queue.empty?
      node = queue.shift
      
      return node if node.data == goal

      moves.each do |move|
        location = method.call(move[1], node.data)

        if !location.nil? && !visited.include?(location)
          visited << location
          queue.push(Node.new(location.map { |n| n + 1 }, node.distance + 1, node))
        end
      end
    end
  end

end

# rubocop:enable Style/Documentation