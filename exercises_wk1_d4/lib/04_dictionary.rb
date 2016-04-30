class Dictionary
  def initialize
    @dictionary = {}
  end

  def add(hash)
    if hash.class == Hash
      @dictionary.merge!(hash)
    else
      @dictionary.merge!(hash => nil)
    end
  end

  def keywords
    @dictionary.keys.sort
  end

  def entries
    @dictionary
  end

  def include?(key)
    @dictionary.keys.include?(key)
  end

  def find(key)
    keys = @dictionary.keys.select { |k| k.include?(key) }

    if keys
      @dictionary.select { |k, v| keys.include?(k) }
    else
      @dictionary
    end
  end

  def printable()
    final_str = []
    @dictionary.keys.each do |k|
      final_str << "[#{k}] \"#{@dictionary[k]}\""
    end
    final_str.sort.join("\n")
  end
end
