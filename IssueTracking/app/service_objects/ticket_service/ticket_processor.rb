#
module IssueTracking
  module TicketService
    #
    class TicketProcessor
      include TicketCreator
      def register_new_ticket(input_params)
        ticket = create_ticket_and_reply(input_params)
        CustomerMailer.register_ticket(ticket).deliver_now
        # CustomerMailer.register_ticket(ticket).deliver_later
        ticket
      end

      def update_ticket(ticket, input_params)
        ticket.update_attributes(input_params)
        CustomerMailer.update_ticket(ticket).deliver_now
        # CustomerMailer.update_ticket(ticket).deliver_later
        ticket
      end
    end
  end
end
