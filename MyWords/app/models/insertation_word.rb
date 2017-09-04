class InsertationWord < ActiveRecord::Base
  belongs_to :insertation
  belongs_to :word
end
