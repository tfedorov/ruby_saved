#
module IssueTracking
  module TicketService
    #
    module TicketCreator
      private

      def create_ticket_and_reply(input_params)
        ActiveRecord::Base.transaction do
          created_ticket = Ticket.create(input_params)
          reply_service = ReplyService::ReplyCreator.new(created_ticket)
          reply_service.create_reply!
          created_ticket
        end
      end
    end
  end
end
