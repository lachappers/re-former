class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])

    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:notice] = "Invalid username"
      # redirect_to login_path
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end

  private


  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
