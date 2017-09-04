module IssueTracking
  #
  class Status < ActiveRecord::Base
    def self.wait_staff_response
      find_by!(status: 'Waiting for Staff Response')
    end

    def self.on_hold
      find_by!(status: 'On hold')
    end
  end
end
