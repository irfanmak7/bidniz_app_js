class SessionsController < ApplicationController

    # Login Form
    def new
        @user = User.new
        if logged_in?
            flash[:message] = "You're already logged in!"
            redirect_to user_path(current_user)
        else
            render 'login'
        end
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

    # Login with Facebook
    def facebookAuth
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    # Logout
    def destroy
        if session[:user_id].present?
            session.delete :user_id
            flash[:message] = "You're successfully logged out"
            redirect to '/'
        else
            session[:user_id] = nil
        end
    end

    private
    
    def user_params
        params.require(:users).permit(:username, :email, :password)
    end

    def auth
        request.env['omniauth.auth']
    end
  
end