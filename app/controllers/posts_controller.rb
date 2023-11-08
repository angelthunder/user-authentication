class PostsController < ApplicationController
  before_action lambda {
    redirect_to new_login_path unless user_logged_in?
  }, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "Successful post created"
    else
      render :new, status: :unprocessable_entity, alert: "Couldn't save post"
    end
  end

  def show
    @post ||= Post.find_by(id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
