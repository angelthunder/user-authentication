class DashboardsController < ApplicationController
  before_action lambda {
    redirect_to new_login_path unless user_logged_in?
  }, only: %i[index]

  def index
  end
end
