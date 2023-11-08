module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?(other)
    other == current_user
  end

  def user_logged_in?
    !!current_user
  end
end
