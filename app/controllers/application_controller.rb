class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include ApplicationHelper

    private

    def require_login
        if !logged_in?
            flash[:danger] = "You have to be logged in to view this page!"
            redirect_to '/'
        end
    end
end