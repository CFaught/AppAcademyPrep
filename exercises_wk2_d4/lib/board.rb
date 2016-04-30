require "byebug"

class Board
  attr_accessor :grid
  def initialize(grid=nil)
    if grid
      @grid = grid
    else
      @grid = Array.new(3) { Array.new(3) }
    end
    @WINNING_COMBOS = [
                        [[0,0],[0,1],[0,2]],
                        [[1,0],[1,1],[1,2]],
                        [[2,0],[2,1],[2,2]],
                        [[0,0],[1,0],[2,0]],
                        [[0,1],[1,1],[2,1]],
                        [[0,2],[1,2],[2,2]],
                        [[0,0],[1,1],[2,2]],
                        [[0,2],[1,1],[2,0]]
                     ]
  end

  def place_mark(coord, player)
    if !empty?(coord)
      raise "Position already filled!"
    end

    self[*coord] = player

  end

  def clear_pos(coord)
    # helper method for computer player to check for a winning position
    self[*coord] = nil
  end

  def empty?(coord)
    if self[*coord] == nil
      return true
    else
      return false
    end
  end

  def winner
    @WINNING_COMBOS.each do |win|
      positions = [nil, nil, nil]
      # debugger
      win.each_with_index do |pos, i|
        if !self.empty?(pos)
          positions[i] = self[*pos]
        end
        if positions[0] != nil && positions[0] == positions[1] && positions[1] == positions[2]
          return positions[0]
        end
      end
    end
    return nil
  end

  def over?
    if self.winner != nil
      return true
    else
      3.times do |i|
        3.times do |j|
          if self.empty?([i,j])
            return false
          end
        end
      end
      return true
    end
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
  end
end

# board = Board.new
# p board.grid
#
# board.place_mark([0, 0], :X)
# board.place_mark([1, 1], :X)
# board.place_mark([2, 2], :X)
# p board.winner
