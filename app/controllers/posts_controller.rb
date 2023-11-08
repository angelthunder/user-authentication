class PostsController < ApplicationController
  before_action lambda {
    redirect_to new_login_path unless user_logged_in?
  }, only: %i[new]

  def new
    @post = current_user.posts.build
  end
end
