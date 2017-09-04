#
module IssueTracking
  module TicketService
    #
    class TicketExtractor
      def self.ticket_by_ref(unique_reference)
        Ticket.find_by_unique_reference!(unique_reference)
      end

      def self.all_unique_references
        Ticket.pluck(:unique_reference)
      end
    end
  end
end
