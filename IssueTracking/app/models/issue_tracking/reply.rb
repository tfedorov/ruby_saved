module IssueTracking
  #
  class Reply < ActiveRecord::Base
    belongs_to :ticket
    belongs_to :status

    belongs_to :user

    before_save :process_status

    def unassigned?
      user_id.nil?
    end

    def staff_name
      StaffUserService::StaffExctractor.staff_name(user_id)
    end

    private

    def process_status
      ReplyService::ReplyStatusProcessor.new(self).process!
    end
  end
end
