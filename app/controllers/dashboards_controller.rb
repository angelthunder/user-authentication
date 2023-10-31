class DashboardsController < ApplicationController
  def index
    redirect_to new_login_path unless logged_in?
  end
end
