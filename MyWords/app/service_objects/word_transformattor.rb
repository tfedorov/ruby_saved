class WordTransformattor
  def self.transform(input_words)
    input_words.uniq.select { |word| word.length > 2 }
  end
end
