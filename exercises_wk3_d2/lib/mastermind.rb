class Code
  attr_reader :pegs

  PEGS = {
            'r' => :red,
            'g' => :green,
            'b' => :blue,
            'y' => :yellow,
            'o' => :orange,
            'p' => :purple
          }

  def initialize(pegs)
    @pegs = pegs
  end

  def self.random
    random_pegs = []
    4.times { random_pegs << PEGS.keys.sample }

    Code.new(random_pegs)
  end

  def self.parse(input)
    input = input.downcase.split("")
    input.each { |color| raise "invalid input" unless PEGS.keys.include?(color) }
    Code.new(input)
  end

  def [](index)
    @pegs[index]
  end

  def exact_matches(input)
    input_color_arr = input.pegs
    count = 0
    input_color_arr.each_with_index do |color, index|
      if (color == @pegs[index])
        count += 1
      end
    end
    count
  end

  def near_matches(input)
    input_color_arr = input.pegs
    matches = []
    count = 0
    input_color_arr.each_with_index do |color, index|
      if @pegs.include?(color) && color != @pegs[index] && matches.count(color) < @pegs.count(color)
        count += 1
        matches << color
      end
    end
    count
  end

  def ==(code)
    if code.class == Code
      return true unless @pegs != code.pegs
    end
    false
  end
end

class Game
  attr_reader :secret_code

  def initialize(secret_code = Code::random)
    @secret_code = secret_code
  end

  def get_guess
    input = gets.chomp.split("")

    Code.new(input)
  end

  def display_matches(code)
    exact = code.exact_matches(@secret_code)
    near = code.near_matches(@secret_code)
    puts "near: #{near}, exact: #{exact}"
  end
end

# code = Code.new('bbbb')
# random = code.random
# p random.pegs
#
# player = code.parse("Bboy")
# p player
