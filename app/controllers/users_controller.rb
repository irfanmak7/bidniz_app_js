class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def show
        @user = User.find_by(id: params[:id])
        @businesses = Business.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user && @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :phone_number, :password)
    end
end