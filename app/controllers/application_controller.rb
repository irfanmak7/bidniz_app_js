class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :require_login

    def require_login
        redirect_to root_path, alert: "You have to login to see this page." unless session.include? :user_id
    end

end
