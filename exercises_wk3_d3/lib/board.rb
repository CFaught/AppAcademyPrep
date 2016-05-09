class Board
  attr_accessor :grid

  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

  def display
    size = @grid.length
    row_str = "+"
    col_str = "|"

    size.times { row_str += "--+" }

    @grid.each do |row|
      row.each do |col|
        if col == nil
          col = " "
        end
        col_str += "#{col} |"
      end
      col_str += "\n" + row_str +"\n|"
    end
    puts row_str
    puts col_str
  end

  def count
    @grid.flatten.count(:s)
  end

  def empty?(pos = nil)
    if pos
      return true unless self[pos] == :s
    else
      @grid.flatten.each { |el| return false if el == :s}
    end
  end

  def full?
    @grid.flatten.each { |el| return false if !el }
  end

  def place_random_ship
    raise "Board is full" if self.full?
    rand_pos = [rand(0...@grid.length), rand(0...@grid.length)]
    if empty?(rand_pos)
      self[rand_pos] = :s
    end
  end

  def won?
    @grid.flatten.each { |el| return false if el == :s }
    true
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.display
end
