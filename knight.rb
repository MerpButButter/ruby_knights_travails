require_relative "styles"
# Chess
class Knight
  attr_accessor :position
  attr_reader :icon
  
  def initialize(position)
    @icon = "♞"
    @position = position
  end


end