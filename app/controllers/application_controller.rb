class ApplicationController < ActionController::Base

    helper_method :current_user, :require_login

    def current_user
        User.find_by(id: session[:user_id])
    end

    def require_login
        redirect_to root_path, alert: "You have to login to see this page." unless session.include? :user_id
    end

    def logged_in?

    end

end
