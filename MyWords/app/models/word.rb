#
class Word < ActiveRecord::Base
  belongs_to :users

  validates :english, length: { minimum: 3 }

  scope :with_user, -> (user_id) { where(user_id: user_id) }

  scope :known_words, -> { where(known: true) }

  scope :un_known_words, -> { where(known: false) }

  scope :user_known, -> (user_id) { with_user(user_id).known_words }

  scope :user_unknown, -> (user_id) { with_user(user_id).un_known_words }

  scope :last_insertation_words, lambda { |insertation_id, known|
    joins('LEFT JOIN insertation_words ON words.id = insertation_words.word_id')
      .where insertation_words: { insertation_id: insertation_id }, known: known
  }
  scope :last_insertation_words2, lambda { |insertation_id|
    joins('LEFT JOIN insertation_words ON words.id = insertation_words.word_id')
      .where insertation_words: { insertation_id: insertation_id }
  }
end
