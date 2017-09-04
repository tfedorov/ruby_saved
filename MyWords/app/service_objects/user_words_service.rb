# Service object
class UserWordsService
  def initialize(user)
    @user = user
  end

  def all_words
    Word.with_user(@user.id).all
  end

  def known_words(is_known)
    return Word.user_known(@user.id) if is_known
    Word.user_unknown(@user.id)
  end

  def make_known(id)
    Word.update(id, known: true)
  end

  def make_not_word(id)
    Word.update(id, known: false)
  end

  def last_insertation(is_known)
    last_insertation = Insertation.with_user(@user.id).last_insertation.first
    Word.last_insertation_words(last_insertation.id, is_known)
  end
end
