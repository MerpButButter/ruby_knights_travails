require_relative "styles"
# Chess
class Knight
  def initialize(position)
    @icon = "♞".color("blue")
    @position = position
  end
end