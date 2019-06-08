class SessionsController < ApplicationController

    # Login Form
    def new
        @user = User.new
        render 'login'
    end

    # Normal Login
    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            flash[:success] = "Welcome #{@user.name}!"
            redirect_to user_path(@user)
        else
            flash[:message] = "Please enter the correct information."
            redirect_to '/login'
        end
    end

    # Login with Facebook
    def facebookAuth
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(10)
        end
        session[:user_id] = @user.id
        flash[:success] = "Welcome #{@user.name}!"
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