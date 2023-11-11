class SiteController < ApplicationController
  def first; end

  def second; end

  def third
    redirect_to second_page_path
  end

  def fourth; end

  def fifth
    @count = 3
  end

  def six
    @name, @email, @age = params[:person].values_at(:name, :email, :age)
    author = User.create_with(password: "123").find_or_create_by(email: @email)

    @count = params[:count].to_i + 1
    @post = author.posts.create(
      title: "Automated Test Post from #{@name}:#{@age}",
      body: "This is #{Time.now}",
    )

    # @post.broadcast_prepend_to(
    #   "teststr",
    #   target: "broadcasts",
    #   html: "<div>NEW POST: #{@post.title}</div>"
    # )
    # if you don't send the :html content,
    # it will look for a partial with the same instance @post.
    Rails.logger.info("BEFORE CONTROLLER - Broadcast Prepend to")
    @post.broadcast_prepend_to("teststr", target: "broadcasts")
    Rails.logger.info("AFTER CONTROLLER - Broadcast Prepend to")
  end
end
