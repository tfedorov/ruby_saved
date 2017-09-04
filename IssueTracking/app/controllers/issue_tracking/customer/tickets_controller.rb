require_dependency 'issue_tracking/application_controller'

module IssueTracking
  #
  class Customer::TicketsController < ApplicationController
    before_filter :extract_ticket_by_param, only: [:update, :show]

    def new
      @ticket = Ticket.new
    end

    def create
      ticket_params = params.require(:ticket).permit(:subject,
                                                     :body, :department, :email,
                                                     :first_name, :last_name)
      @ticket = processor.register_new_ticket(ticket_params)
      redirect_to @ticket.url
    end

    def update
      ticket_params = params.require(:ticket).permit(:subject,
                                                     :body, :department, :email,
                                                     :first_name, :last_name)
      processor.update_ticket(@ticket, ticket_params)
      redirect_to @ticket.url
    end

    private

    def extract_ticket_by_param
      unique_reference = params.require(:id)
      @ticket = TicketService::TicketExtractor.ticket_by_ref(unique_reference)
    end

    def processor
      @processor ||= TicketService::TicketProcessor.new
    end
  end
end
