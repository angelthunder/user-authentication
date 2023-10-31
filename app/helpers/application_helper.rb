module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?(other)
    other.is_a?(current_user.class) && other.id == current_user.id
  end
end
