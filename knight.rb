require_relative "styles"
# Chess
class Knight
  attr_accessor :position
  attr_reader :icon
  
  MOVES = { ul: [-2, -1], ur: [-2, 1], lu: [-1, -2], ld: [1, -2], dl: [2, -1], dr: [2, 1], rd: [1, 2], ru: [-1, 2] }.freeze

  public_constant :MOVES

  def initialize(position)
    @icon = "♞"
    @position = position
  end
end