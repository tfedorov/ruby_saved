module IssueTracking
  #
  class Ticket < ActiveRecord::Base
    belongs_to :reply
    has_many :replies

    alias_method :active_reply, :reply
    alias_method :active_reply=, :reply=

    validates :email, email: true

    before_create :generate_ref_columns

    scope :search_subject, ->(word) { where('subject LIKE ?', "%#{word}%") }
    scope :search_everywhere_in_reply, lambda { |word|
      where('subject LIKE :words OR body LIKE :words OR email LIKE :words',
            words: "%#{word}%")
    }

    private

    def generate_ref_columns
      generate_uniq_ref
      generate_url
    end

    def generate_uniq_ref
      self.unique_reference = ReferenceService::UniqTicketReferenceGenerator.instance.uniq_reference
    end

    def generate_url
      self.url = "/issue_tracking/customer/tickets/#{self.unique_reference}"
    end
  end
end
