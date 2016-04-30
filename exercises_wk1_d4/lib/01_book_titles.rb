class Book
  attr_accessor :title

  def initialize(title=nil)
    @title = title
  end

  def title
    @title = capitalize_title
    @title
  end

  private
  def capitalize_title
    exempt_words = ["the", "in", "and", "but", "an", "is", "a", "of"]
    tmp = @title.split(" ")

    tmp.each_with_index do |word, index|
      if !exempt_words.include?(word) || index == 0
        word.capitalize!
      end
    end

    tmp.join(" ")
  end
end

# book = Book.new
# book.title = "the builder"
# p book.title
