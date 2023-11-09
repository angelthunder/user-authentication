class SiteController < ApplicationController
  def first; end

  def second; end

  def third
    redirect_to second_page_path
  end

  def fourth; end

  def fifth; end

  def six
    @name, @email, @age = params[:person].values_at(:name, :email, :age)
  end
end
