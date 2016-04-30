class Temperature
  # These two class methods convert a temperature into an options hash which
  # is passed to Temperature.new(temp), which in turn is passed to the initialize
  # method.
  def self.from_fahrenheit(temp)
    self.new(f: temp)
  end

  def self.from_celsius(temp)
    self.new(c: temp)
  end

  # the initialize method takes the options hash and sets the instance variable
  # @temperature to what the corresponding temperature is in that scale that was
  # passed with the options hash.
  def initialize(options)
    if options[:f]
      self.fahrenheit = options[:f]
    else
      self.celsius = options[:c]
    end
  end

  # these get called in the initialize class method to do the @temperature setting
  def fahrenheit=(temp)
    @temperature = self.class.ftoc(temp)
  end

  def celsius=(temp)
    @temperature = temp
  end

  # these are instance methods that are called on the object to return the converted
  # temperature.
  def in_fahrenheit
    self.class.ctof(@temperature)
  end

  def in_celsius
    @temperature
  end

  # these are class helper methods that do the actual converting.
  def self.ctof(temp)
    (temp * 9 / 5.0) + 32
  end

  def self.ftoc(temp)
    (temp - 32) * (5 / 9.0)
  end
end

# the other way to do this is by calling a subclass which has inherited the Temperature
# class.
class Celsius < Temperature
  def initialize(temp)
    self.celsius = temp
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    self.fahrenheit = temp
  end
end
