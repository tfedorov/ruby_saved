#
module IssueTracking
  #

  module ReplyService
  #
    class ReplyStatusProcessor
      def initialize(reply)
        @reply = reply
        @current_status = reply.status
      end

      def process!
        return process_waiting_for_staff if unassigned?
        return process_on_hold if on_hold?
      end

      private

      def unassigned?
        @reply.user_id.nil?
      end

      def process_waiting_for_staff
        @reply.status = Status.wait_staff_response
      end

      def process_on_hold
        @reply.status = Status.on_hold
      end

      def on_hold?
        return true if @current_status.nil?
        @current_status == Status.wait_staff_response
      end
    end
  end
end
