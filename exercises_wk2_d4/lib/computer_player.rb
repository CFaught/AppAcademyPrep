class ComputerPlayer
  attr_accessor :name, :mark
  def initialize(name)
    @name = name
    # @mark = mark
    @board = nil
  end

  def display(board)
    @board = board
  end

  def board
    @board
  end

  def get_move
    # check for winning move, return that position if available
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        if @board.empty?([i, j])
          @board.place_mark([i, j], @mark)
          if @board.winner == @mark
            @board.clear_pos([i, j])
            return [i, j]
          else
            @board.clear_pos([i, j])
          end
        end
      end
    end

    # else select a random position that is empty
    positions = []

    @board.grid.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        if @board.empty?([i, j])
          positions << [i, j]
        end
      end
    end
    positions.sample
  end
end
