class BusinessesController < ApplicationController
    before_action :require_login
    before_action :find_business, only: [:show, :edit, :update, :destroy]

    def index
        @businesses = current_user.businesses.all
        respond_to do |f|
            f.html { render :all }
            f.json { render json: @businesses }
        end
    end

    def all
        @businesses = Business.all
        respond_to do |f|
            f.html { render :all} 
            f.json { render json: @businesses }
        end
    end

    def show
        @comments = Comment.where(business_id: @business)
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
        if @business.update(business_params)
            redirect_to user_business_path(current_user, @business)
          else
            render :edit
        end
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