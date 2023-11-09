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
    @count = params[:count].to_i + 1
  end
end
