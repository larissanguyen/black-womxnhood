class UsersController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticated, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if  @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to "/signup"
    end

  end

  def show
    # test_user
    @fav_topics = @user.fav_topics
    @resources = @user.all_resources
  end
  
  def edit
  end
  
  def update
    @user.assign_attributes(user_params)
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      flash[:message] = "Sorry, invalid inputs."
      redirect_to edit_user_path(@user)
    end
  end
  
  def destroy
    # test_user
    @user.delete
    redirect_to "/signup"
  end

  private
  
  # def test_user
  #   @user = User.find(params[:id])
  # end
  
  def current_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :bio, :password, :password_confirmation)
  end
end
