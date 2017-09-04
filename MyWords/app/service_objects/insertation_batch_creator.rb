#
class InsertationBatchCreator
  def initialize(user, description)
    @user = user
    @description = description
  end

  def create_insertation_words(words)
    @words = words
    @insertation = Insertation.create(user: @user, description: @description)
    InsertationWord.import build_insertation_words
  end

  private

  def build_insertation_words
    @words.map do|word|
      InsertationWord.new(insertation: @insertation, word: word)
    end
  end
end
