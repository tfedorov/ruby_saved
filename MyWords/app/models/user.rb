class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :words

  has_many :insertations

  def last_user_insertation
    insertations.order(updated_at: :desc).limit(1).first
  end
end
