require_dependency "issue_tracking/application_controller"

module IssueTracking
  class Staff::RepliesListController < IssueTracking::Staff::StaffController
    def unassigned
      @tickets = ReplyService::RepliesList.unassigned_tickets
      render :list
    end

    def open
      @tickets = ReplyService::RepliesList.open_tickets
      render :list
    end

    def all
      @tickets = ReplyService::RepliesList.all
      render :list
    end

    def search_subject
      subject_text = params.require(:subject_text)
      @tickets = ReplyService::RepliesList.search_subject(subject_text)
      render :list
    end

    def search_words
      words = params.require(:words)
      @tickets = ReplyService::RepliesList.search_words(words)
      render :list
    end
  end
end
