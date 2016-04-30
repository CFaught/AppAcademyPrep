# require "byebug"
# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp/) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi
  attr_reader :towers
  def initialize(size=3)
    @size = size
    @towers = [[],[],[]]
    @winning = @towers[0]

    @size.times { |disc_size| @towers[0] << (@size - disc_size) }
  end

  def play
    puts "Welcome to the Tower of Hanoi game!!"

    while !won?

      self.render
      puts "What tower will you move from? (0, 1, or 2): "
      from = gets.chomp.to_i
      puts "What tower will you move to? (0, 1, or 2): "
      to = gets.chomp.to_i
      if self.valid_move?(from, to)
        self.move(from, to)
      else
        puts
        puts "Can't do that.."
        puts
      end
    end
    puts
    puts "CONGRATULATIONS, WINNER!!"
    puts
  end

  def move(from_tower, to_tower)
    tower1 = from_tower
    tower2 = to_tower
    disc = @towers[tower1].pop
    @towers[tower2].push(disc)
  end

  def valid_move?(from_tower, to_tower)
    if @towers[from_tower][-1] != nil
      if @towers[to_tower][-1] == nil
        return true
      else
        return @towers[from_tower][-1] < @towers[to_tower][-1]
      end
    else
      return false
    end

  end

  def won?
    2.times do |i|
      if @towers[i + 1] == @winning
        return true
      end
    end
    return false
  end

  def render
    spacing = @size * 2
    rows = []
    towers = @towers
    towers = towers.map { |tower| tower.reverse }
    towers.each do |tower|
      if tower.size < @size
        (@size - tower.size).times { |i| tower.unshift(0)}
      end
    end

    @size.times { rows << " " }
    towers.each do |array|

      array.each_with_index do |disc, i|
        if disc != 0
          disc.times { rows[i] += "-" }
          (spacing - disc + 1).times { rows[i] += " " }
        elsif disc == 0
          rows[i] += "|"
          spacing.times { rows[i] += " "}
        end
      end
    end
    # p towers
    puts
    rows.each { |row| puts row }
    puts
  end
  @towers
end


if $PROGRAM_NAME == __FILE__
  tower = TowersOfHanoi.new
  tower.play
end
