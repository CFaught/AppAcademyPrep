def reverser(&prc)
  words = prc.call.split
  final = []
  words.each do |word|
    final << word.reverse
  end
  final.join(" ")
end

def adder(input=1, &prc)
  prc.call + input
end

def repeater(n=1, &prc)
  n.times { prc.call }  
end
