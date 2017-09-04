#
module IssueTracking
  module ReplyService
    #
    class ReplyCreator
      def initialize(ticket)
        @ticket = ticket
      end

      def create_reply!(input_params = {})
        # status process
        new_reply = Reply.new(input_params)
        new_reply.ticket = @ticket
        new_reply.save
        @ticket.active_reply = new_reply
        @ticket.save
        @ticket.reload
        new_reply
      end

      def build_reply_as_previous
        active_reply_status = @ticket.active_reply.status
        active_reply_user_id = @ticket.active_reply.user_id
        Reply.new(ticket: @ticket, status: active_reply_status,
                  user_id: active_reply_user_id)
      end
    end
  end
end
