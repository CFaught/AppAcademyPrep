class HumanPlayer
  attr_accessor :name, :mark
  def initialize(name)
    @name = name
    # @mark = mark
  end

  def display(board)
    puts " #{board.grid[0][0]} | #{board.grid[0][1]} | #{board.grid[0][2]} "
    puts "-----------"
    puts " #{board.grid[1][0]} | #{board.grid[1][1]} | #{board.grid[1][2]} "
    puts "-----------"
    puts " #{board.grid[2][0]} | #{board.grid[2][1]} | #{board.grid[2][2]} "
  end

  def get_move
    puts "where"
    input_pos = gets.chomp
    pos = input_pos.split(", ")
    pos.map { |e| e.to_i }
  end
end
