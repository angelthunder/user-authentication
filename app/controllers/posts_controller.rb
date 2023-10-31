class PostsController < ApplicationController
  before_action -> { redirect_to_login unless logged_in? }, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = "successful post created"
      redirect_to posts_path
    else
      flash[:alert] = "couldn't save post"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
