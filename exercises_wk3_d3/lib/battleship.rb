class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board)
    @board = board
    @player = player
  end

  def attack(pos)
    @board[pos] = :x
  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  def play_turn
    pos = @player.get_play
    attack(pos)

  end
end
