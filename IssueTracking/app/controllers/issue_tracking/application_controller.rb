module IssueTracking
  #
  class ApplicationController < ActionController::Base
    #rescue_from ActiveRecord::ActiveRecordError, with: :error_render_method

    private

    def error_render_method
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end
end
