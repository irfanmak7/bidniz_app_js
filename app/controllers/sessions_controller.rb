class SessionsController < ApplicationController

    def new
    end

    # Normal Login
    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Please enter the correct information."
            redirect_to login_path
        end
    end

    def facebookAuth

    end
end