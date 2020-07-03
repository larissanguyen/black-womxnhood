class SessionsController < ApplicationController

    skip_before_action :authenticated, only: [:new, :create]
    
    def new
        @message = flash[:message]
    end

    def create
        @user = User.find_by(name: params[:name])
        # byebug
        if valid_login?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        elsif !user_exist?
            flash[:message] = "No user found with that name"
            # byebug
            redirect_to "/login"
        elsif !correct_password?
            
            flash[:message] = "Incorrect password"
            # byebug
            redirect_to "/login"
        else
           
            flash[:message] = "Sorry, unknown error"
            # byebug
            redirect_to "/login"
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to "/login"
    end
    
    private
    
    def user_exist?
        @user != nil
    end
    
    def correct_password?
        @user.authenticate(params[:password])
    end
    
    def valid_login?
        user_exist? && correct_password?
    end
end