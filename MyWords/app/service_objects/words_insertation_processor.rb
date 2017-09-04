#
class WordsInsertationProcessor
  def initialize(user)
    @user = user
    @word_creator = WordBatchCreator.new(@user)
  end

  def make_insertaion_word(input_params)
    insertation_creator = insertation_creator(input_params)
    input_words = input_words_extract(input_params)
    ActiveRecord::Base.transaction do
      words_to_create = new_words_extract(input_words)
      new_words = @word_creator.create_words(words_to_create)
      insertation_creator.create_insertation_words(new_words)
      new_words
    end
  end

  private

  def new_words_extract(input_words)
    input_words - @user.words.where(english: input_words).map(&:english)
  end

  def insertation_creator(input_params)
    insertation_desc = description_extract(input_params)
    InsertationBatchCreator.new(@user, insertation_desc)
  end

  def input_words_extract(input_params)
    WordTransformattor.transform(input_params[:words])
  end

  def description_extract(input_params)
    input_params[:description] || 'undefined'
  end
end
