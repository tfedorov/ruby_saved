#
module IssueTracking
  module ReplyService
    #
    class ReplyProcessor
      def initialize(ticket)
        @ticket = ticket
        @creator = ReplyCreator.new(ticket)
      end

      def process_reply(input_params)
        new_reply = @creator.create_reply!(input_params)
        CustomerMailer.register_reply(@ticket).deliver_now
        new_reply
      end
    end
  end
end
