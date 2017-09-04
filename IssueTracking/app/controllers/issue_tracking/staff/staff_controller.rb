require_dependency "issue_tracking/application_controller"

module IssueTracking
  #
  module Staff
    #
    class StaffController < ApplicationController
      layout 'issue_tracking/staff'
      before_filter :authentificate!

      private

      def authentificate!
        @staff_user = IssueTracking.authentificator.authentificate!(self)
      end
    end
  end
end
