class LoginsController < ApplicationController
  def new
    user = User.find_by(id: session[:user_id])
    redirect_to dashboards_path if user.present? 
    @user = User.new
  end

  def create
    @user = User.find_by(login_params)

    if @user.present?
      session[:user_id] = @user.id
      redirect_to dashboards_path
    else
      flash[:alert] = "email or password is wrong!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == params[:id].to_i
      session[:user_id] = nil
      redirect_to root_path, notice: "You have successfully logged out"
    else
      redirect_to root_path, notice: "You can not log out"
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
