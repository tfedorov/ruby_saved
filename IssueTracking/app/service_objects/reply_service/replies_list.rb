#
module IssueTracking
  module ReplyService
    #
    class RepliesList
      def self.unassigned_tickets
        Ticket.includes(:reply).select { |ticket| ticket.active_reply.unassigned? }
      end

      def self.open_tickets
        Ticket.includes(:reply).reject { |ticket| ticket.active_reply.unassigned? }
      end

      def self.all
        Ticket.includes(:reply).all
      end

      def self.search_subject(subcjet_text)
        Ticket.includes(:reply).search_subject(subcjet_text)
      end

      def self.search_words(words)
        Ticket.includes(:reply).search_everywhere_in_reply(words)
      end
    end
  end
end
