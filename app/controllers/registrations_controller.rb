class RegistrationsController < ApplicationController
  before_action lambda {
    redirect_to dashboards_path if user_logged_in?
  }, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      flash[:notice] = "successful registration"
      redirect_to(new_login_path)
    else
      flash[:alert] = @user.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
