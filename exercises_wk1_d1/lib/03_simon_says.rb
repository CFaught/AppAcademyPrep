def echo(phrase)
  phrase
end

def shout(phrase)
  phrase.upcase
end

def repeat(phrase, num=2)
  final = ""
  num.times do |i|
    if i < num && i > 0
      final += " "
    end
    final += phrase
  end
  final
end

def start_of_word(word, num_of_letters=1)
  word[0,num_of_letters]
end

def first_word(phrase)
  phrase.split(" ")[0]
end

def titleize(phrase)
  final = []
  words = phrase.split(" ")
  small_words =["is", "and", "over", "the"]

  words.each_with_index do |word, i|
    if small_words.include?(word) && i != 0
      final << word
    else
      final << word.capitalize
    end
  end
  final.join(" ")
end
