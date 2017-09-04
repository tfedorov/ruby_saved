class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def single_page_app
    render template: 'layouts/single_page_application'
  end

  def after_sign_in_path_for(_resource)
    set_return_to_root
  end

  def after_inactive_sign_up_path_for(_resource)
    set_return_to_root
  end

  private

  def set_return_to_root
    session['user_return_to'] || root_path
  end
end
