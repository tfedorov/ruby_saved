#
class WordBatchCreator
  def initialize(user)
    @user = user
  end

  def create_words(input_words)
    @input_words = input_words
    builded_words = build_words
    Word.import builded_words
    builded_words
  end

  private

  def build_words
    @input_words.map do |input_word|
      Word.new(english: input_word, user_id: @user.id)
    end
  end
end
