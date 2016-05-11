require "byebug"

class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
  end

  def guesser
    @guesser
  end

  def setup
    length = @referee.pick_secret_word
    @guesser.register_secret_length(length)
    @board = Array.new(length)
  end

  def take_turn
    guess = @guesser.guess
    @referee.check_guess(guess)
    self.update_board
    @guesser.handle_response
  end

  def update_board
    # TODO
  end
end

class HumanPlayer
end

class ComputerPlayer

  def initialize(dictionary)
    @dictionary = dictionary
    @candidate_words = dictionary
    @secret_word
    @secret_word_length
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word_length = @secret_word.length
  end

  def check_guess(letter)
    indices = []
    if @secret_word.include?(letter)
      letters = @secret_word.split("")
      letters.each_with_index do |ltr, idx|
        if ltr == letter
          indices.push(idx)
        end
      end
    end
    indices
  end

  def register_secret_length(length)
    @secret_word_length = length
    @candidate_words.delete_if { |word| word.length != @secret_word_length}
    @secret_word_length
  end

  def guess(board)
    @board = board
    freq_table = freq_table(board)

    most_frequent_letters = freq_table.sort_by { |letter, count| count }
    letter, _ = most_frequent_letters.last
    # guess_letter = ('a'..'z').to_a.sample
    letter
  end

  def handle_response(guessed, positions)
    @candidate_words.reject! do |word|
      delete = false

      word.split("").each_with_index do |letter, index|
        if (letter == guessed) && (!positions.include?(index))
          delete = true
          break
        elsif (letter != guessed) && (positions.include?(index))
          delete = true
          break
        end
      end
      delete
    end
  end

  def candidate_words
    @candidate_words
  end

  private
  def freq_table(board)
    freq_table = Hash.new(0)

    @candidate_words.each do |word|
      board.each_with_index do |letter, index|
        freq_table[word[index]] += 1 if letter.nil?
      end
    end
    freq_table
  end
end
