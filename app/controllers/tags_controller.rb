class TagsController < ApplicationController

    def create
        @business = Business.find(params[:business_id])
        @tag = @business.tags.create(tag_params)

        if @tag.save
            redirect_to user_business_path(@business.user_id, @business)
        else
            render :new
        end
    end

    private

    def tag_params
        params.require(:tag).permit(:name)
    end

end