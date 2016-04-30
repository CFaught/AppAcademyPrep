class Integer
  def in_words(test=true)
    num_hash = {1000000000000 => "trillion",
                1000000000 => "billion",
                1000000 => "million",
                1000 => "thousand",
                100 => "hundred",
                90 => "ninety",
                80 => "eighty",
                70 => "seventy",
                60 => "sixty",
                50 => "fifty",
                40 => "forty",
                30 => "thirty",
                20 => "twenty",
                19 => "nineteen",
                18 => "eighteen",
                17 => "seventeen",
                16 => "sixteen",
                15 => "fifteen",
                14 => "fourteen",
                13 => "thirteen",
                12 => "twelve",
                11 => "eleven",
                10 => "ten",
                9 => "nine",
                8 => "eight",
                7 => "seven",
                6 => "six",
                5 => "five",
                4 => "four",
                3 => "three",
                2 => "two",
                1 => "one"}

    number = self
    if test == true && number == 0
      return "zero"
    end
    num_hash.each do |key, value|
      if test == false && number == 0
        return ""
      elsif number < 10 && number/key > 0
        return value
      elsif number < 100 && number/key > 0
        if number%key == 0
          return value
        end
        result = (number%key).in_words(false)
        if result != ""
          result = " " + result
        end
        return "#{value}" + result
      elsif number/key > 0
        result = (number%key).in_words(false)
        if result != ""
          result = " " + result
        end
        return (number/key).in_words(false) + " #{value}" + result

      end
    end
  end
end
