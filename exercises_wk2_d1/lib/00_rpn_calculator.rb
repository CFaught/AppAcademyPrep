# require 'byebug'
class RPNCalculator
  attr_accessor :file
  def initialize(stack=[])
    @stack = stack
    @token_arr = []
  end

  def push(item)
    @stack.push(item)
  end

  def pop()
    @stack.pop
  end

  def value
    @stack[-1]
  end

  def plus
    check_array
    @stack.push(@stack.pop + @stack.pop)
  end

  def minus
    check_array
    second = @stack.pop
    first = @stack.pop
    @stack.push(first - second)
  end

  def times
    check_array
    second = @stack.pop.to_f
    first = @stack.pop.to_f
    @stack.push(first * second)
  end

  def divide
    check_array
    second = @stack.pop.to_f
    first = @stack.pop.to_f
    @stack.push(first / second)
  end

  def tokens(str)
    @token_arr = str.split(" ")
    @token_arr.map do |i|
      if !!(i =~ /\A[-+]?[0-9]+\z/)
        i = i.to_i
      else
        i = i.to_sym
      end
    end
  end

  def evaluate(str)
    self.tokens(str)
    @token_arr.each do |i|
      if i.to_s == "+"
        self.plus
      elsif i.to_s == "-"
        self.minus
      elsif i.to_s == "*"
        self.times
      elsif i.to_s == "/"
        self.divide
      else
        @stack.push(i.to_i)
      end
    end
    self.value
  end

  def calculate
    puts "Welcome to the Reverse Polish Notation Calculator, input your"
    puts "calculations: "

    input = gets.chomp

    self.evaluate(input)
    input = 0
    while input != ""
      input = gets.chomp
      self.evaluate(input)
    end
    puts self.value
  end

  private
  def check_array
    if @stack.size < 2
      raise "calculator is empty"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  file = ARGV[0]
  calculator = RPNCalculator.new
  calculator.file = file
  calculator.calculate
end
# calculator = RPNCalculator.new
#
#
# calculator.push(1)
# calculator.push(2)
# p calculator.plus
# p calculator.value
# calculator.push(4)
# p calculator.plus
