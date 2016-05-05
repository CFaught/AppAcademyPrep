require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :current_player
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @current_player = @player_one
  end

  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def play_turn
    @current_player.display(@board)
    @board.place_mark(@current_player.get_move, @current_player.mark)
    self.switch_players!
  end

  def play
    while !@board.over?
      self.play_turn
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new()
  # file_shuffle
end
