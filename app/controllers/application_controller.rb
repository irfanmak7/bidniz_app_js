class ApplicationController < ActionController::Base

    helper_method :current_user, :require_login

    def current_user
    end

end
