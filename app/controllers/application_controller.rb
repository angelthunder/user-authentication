class ApplicationController < ActionController::Base
  include ApplicationHelper

  private

  def logged_in?
    !current_user.nil?
  end

  def redirect_to_login
    redirect_to new_login_path
  end
end
