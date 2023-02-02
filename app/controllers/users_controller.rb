class UsersController < ApplicationController
  before_action :authorized, only: [:show]
  before_action :set_user, only: %i[ edit update destroy ]
  
  # before_action :set_user, only: %i[ edit update destroy]
  
  # before_action :ensure_current_user
  
  def index
    @users = User.all
    # @user = current_user
  end



  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if @user.save
      flash[:success] = "User created"
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:notice] = @user.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end

  end

    # @user = User.new(user_params)
    # if @user.save
    #   session[:user_id] = @user.id
    #   redirect_to posts_path
    # else
    #   flash.now[:notice] = @user.errors.full_messages.to_sentence
    #   render :new, status: :unprocessable_entity
    # end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      # respond_to do |format|
        if @user.update(user_params)
          flash[:success] = "User updated"
          redirect_to user_url(@user)
          # format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
          # format.json { render :show, status: :ok, location: @user }
        else
          flash.now[:notice] = @user.errors.full_messages.to_sentence
          render :edit, status: :unprocessable_entity
          # format.html { render :edit, status: :unprocessable_entity }
          # format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      # end

    end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
