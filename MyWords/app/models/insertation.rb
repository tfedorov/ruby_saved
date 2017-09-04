class Insertation < ActiveRecord::Base
  belongs_to :user

  scope :with_user, -> (user_id) { where(user_id: user_id) }

  scope :last_insertation, -> { order(updated_at: :desc).limit(1) }
end
