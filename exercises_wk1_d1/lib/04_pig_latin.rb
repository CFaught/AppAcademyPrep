def translate(phrase)
  vowels = ['a', 'e', 'i', 'o', 'u']
  words = phrase.split(" ")
  final = []

  words.each do |word|
    if vowels.include?(word[0])
      final << word + "ay"
    else
      word = word.split("")
      index = 0
      word.each_with_index do |letter, i|
        if vowels.include?(letter)
          if letter == 'u' && word[i - 1] == 'q'
            index = i
            break
          else
            index = i - 1
            break
          end
        end
      end
      word = word.join('')
      final << word[index + 1..-1] + word[0..index] + "ay"
    end
  end
  final.join(" ")
end
