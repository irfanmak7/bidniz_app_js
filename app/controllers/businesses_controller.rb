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

    end

    def new
        @business = Business.new(user_id: params[:user_id])
    end

    def create
        @business = current_user.businesses.build(business_params)

        if @business.save
            redirect_to user_business_path(@business.user, @business)
        else
            render :new
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