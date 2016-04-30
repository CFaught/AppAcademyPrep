def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(arr)
  total = 0
  arr.each do |i|
    total += i
  end
  total
end

def multiply(*args)
  total = 1
  args.each do |arg|
    total *= arg
  end
  total
end

def power(num, exp)
  num ** exp
end

def factorial(num)
  total = 1
  if num == 0
    return total
  end
  num.times do |i|
    total *= i + 1
  end
  total
end
