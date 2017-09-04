#
module IssueTracking
  #
  module StaffAuthService
    #
    class DeviseAuthStrategy
      def authentificate!(context)
        context.authenticate_user!
      end
    end
  end
end
