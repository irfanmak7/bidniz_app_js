class BusinessesController < ApplicationController
    before_action :require_login
    before_action :find_business, only: [:show, :edit, :update, :destroy]

    def index
        @businesses = current_user.businesses.all
    end

    def show
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
        @business.destroy
        redirect_to businesses_path
    end

    private

    def business_params
        params.require(:business).permit(:name, :description, :address, :price, :user_id)
    end

    def find_business
        @business = Business.find(params[:id])
      end
end