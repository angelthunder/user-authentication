class ApplicationController < ActionController::Base
  include ApplicationHelper

  private

  def redirect_to_login
    redirect_to new_login_path
  end
end
