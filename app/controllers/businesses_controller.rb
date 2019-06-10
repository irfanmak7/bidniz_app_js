class BusinessesController < ApplicationController
    before_action :require_login

    def index
        if params[:user_id]
            @businesses = User.find(params[:user_id]).businesses
        else
            @businesses = Business.all
        end
    end

    def show
        @business = Business.find(params[:id])
    end

    def new
        @business = Business.new
    end

    def create
        @business = current_user.businesses.build(business_params)

        if @business.save
            redirect_to user_business_path(current_user, @business)
        else
            redirect_to new_business_path
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def business_params
        params.require(:business).permit(:name, :description, :address, :price, :user_id)
    end
end