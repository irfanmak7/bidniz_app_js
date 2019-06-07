class UsersController < ApplicationController
    def show
    @user = User.find(params[:id])
    @businesses = @user.businesses
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if user.save
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :phone_number, :password)
    end
end