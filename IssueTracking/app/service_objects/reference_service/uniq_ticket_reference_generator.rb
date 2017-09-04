#
module IssueTracking
  module ReferenceService
    #
    class UniqTicketReferenceGenerator
      require 'singleton'
      require 'set'
      include Singleton

      OVERFLOW_MESSAGE = 'Ticket References are overflow'

      def initialize
        @generator = ReferenceGenerator.new
        already_taken_refs = TicketService::TicketExtractor.all_unique_references
        @taken_references_cache = Set.new(already_taken_refs)
      end

      def uniq_reference
        check_overflow
        new_reference = ensure_untaken_reference
        add_to_taken(new_reference)
        new_reference
      end

      private

      def check_overflow
        fail OVERFLOW_MESSAGE if @taken_references_cache.size > ReferenceGenerator::REFERENCES_MAX_NUMBER
      end

      def ensure_untaken_reference
        loop do
          random_uniq = @generator.generate_random
          return random_uniq unless @taken_references_cache.member? random_uniq
        end
      end

      def add_to_taken(new_reference)
        @taken_references_cache.add(new_reference)
      end
    end
  end
end
