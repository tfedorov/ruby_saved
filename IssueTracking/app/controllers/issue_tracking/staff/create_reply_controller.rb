require_dependency "issue_tracking/application_controller"

module IssueTracking
  #
  class Staff::CreateReplyController < IssueTracking::Staff::StaffController
    before_filter :extract_ticket_by_ref
    before_filter :form_variablse_set

    def new
      creator = ReplyService::ReplyCreator.new(@ticket)
      @reply = creator.build_reply_as_previous
    end

    def create
      ticket_params = params.require(:reply).permit(:reply_text,
                                                    :status_id, :user_id)
      processor = ReplyService::ReplyProcessor.new(@ticket)
      @reply = processor.process_reply(ticket_params)
      render :new
    end

    def search_reference
      redirect_to staff_reply_path(@ticket.unique_reference) unless @ticket.nil?
      redirect_to(:back) if @ticket.nil?
    end

    private

    def form_variablse_set
      @available_users = StaffUserService::StaffExctractor.staffs
      @statuses = Status.all
    end

    def extract_ticket_by_ref
      @ticket ||= Ticket.find_by_unique_reference(params.require(:ticket_id))
    end
  end
end
