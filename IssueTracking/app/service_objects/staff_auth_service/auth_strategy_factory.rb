#
module IssueTracking
  #
  module StaffAuthService
    #
    class AuthStrategyFactory
      def self.extract(configurable_strategy)
        case configurable_strategy
        when 'devise_strategy'
          DeviseAuthStrategy.new
        # extend it
        else
          DeviseAuthStrategy.new
        end
      end
    end
  end
end
