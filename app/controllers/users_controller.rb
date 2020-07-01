class UsersController < ApplicationController

  skip_before_action :authenticated, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if  @user.valid?
      @user.save
      redirect_to @user
    else
      redirect_to "/signup"
    end

  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
