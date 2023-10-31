module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?(other)
    current_user.eql?(other)
  end

  def logged_in?
    !!current_user
  end
end
