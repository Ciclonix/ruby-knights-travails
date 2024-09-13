class Square
  include Comparable

  attr_accessor :x, :y, :path

  def initialize(x, y, path = [])
    @x = x
    @y = y
    @path = path.append([x, y])
    p path
  end

  def <=>(other)
    return [x, y] <=> [other.x, other.y]
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
      Square.new(x, y, path) if x.between?(0,7) && y.between?(0,7)
    end
    possible_moves.compact!
    return possible_moves
  end
end


def knight_moves(start, finish)
  start_square = Square.new(start[0], start[1])
  finish_square = Square.new(finish[0], finish[1])
  return findShortestPath(start_square, finish_square)
end


def findShortestPath(from_square, to_square)
  visited = []
  queue = [from_square]
  loop do
    temp = []
    queue.each do |square|
      return square if square == to_square

      visited << square
      temp << square.possibleKnightMoves
    end
    temp.flatten!
    visited.each do |square|
      temp.each do |temp_square|
        temp.delete(temp_square) if square == temp_square
      end
    end
    queue = temp
    p queue
  end
end


p knight_moves([0,0], [1,2])
