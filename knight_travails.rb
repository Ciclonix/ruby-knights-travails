class Square
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def possibleKnightMoves
    possible_moves = [
      [x + 1, y + 2],
      [x + 1, y - 2],
      [x - 1, y + 2],
      [x - 1, y - 2],
      [x + 2, y + 1],
      [x + 2, y - 1],
      [x - 2, y + 1],
      [x - 2, y - 1]
    ]
    possible_moves.map! do |coords|
      x = coords[0]
      y = coords[1]
      Square.new(x, y) if x.between?(0,7) && y.between?(0,7)
    end
    possible_moves.compact!
    return possible_moves
  end
end
