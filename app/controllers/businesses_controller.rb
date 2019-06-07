class BusinessesController < ApplicationController
    before_action :require_login

    def index
        @user = User.find_by(id: params[:user_id])
        # @user ? @businesses = @user.businesses : page_not_found
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end
end