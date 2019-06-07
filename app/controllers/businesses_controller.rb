class BusinessesController < ApplicationController

    def index
        @user = User.find_by(id: params[:user_id])
        # @user ? @businesses = @user.businesses : page_not_found
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