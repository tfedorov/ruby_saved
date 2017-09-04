module IssueTracking
  #
  class CustomerMailer < ApplicationMailer
    def register_ticket(ticket)
      @ticket = ticket
      mail(to: ticket.email)
    end

    def update_ticket(ticket)
      @ticket = ticket
      mail(to: ticket.email)
    end

    def register_reply(ticket)
      @ticket = ticket
      mail(to: ticket.email)
    end
  end
end
