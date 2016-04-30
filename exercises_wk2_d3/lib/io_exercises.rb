# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  Random.srand
  random_num = Random.rand(1..100)
  # p random_num
  guesses = 1

  puts "Guess a number"
  input = gets.chomp.to_i
  puts input

  while input != random_num
    if input > random_num
      puts "too high"
    elsif input < random_num
      puts "too low"
    else
      break
    end

    guesses += 1

    puts "Guess a number"
    input = gets.chomp.to_i
    puts input
  end
  puts "correct! You're number of guesses: #{guesses}"
end

def file_shuffle
  puts "Enter file to shuffle: "
  file = gets.chomp

  file_array = File.readlines(file)
  file_array = file_array.shuffle

  File.open(file, "w") do |f|
    file_array.each do |line|
      f.puts line
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  guessing_game
  # file_shuffle
end
