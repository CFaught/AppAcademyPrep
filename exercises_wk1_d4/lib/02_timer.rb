class Timer
  attr_accessor :seconds
  def initialize
    @seconds = 0
  end

  def time_string
    hours = @seconds / 3600
    minutes = (@seconds / 60) % 60
    seconds = @seconds % 60
    "#{padded(hours)}:#{padded(minutes)}:#{padded(seconds)}"
  end

  def padded(number)
    num_str = ""
    if number < 10
      num_str += "0" + number.to_s
    else
      num_str += number.to_s
    end
    num_str
  end
end
