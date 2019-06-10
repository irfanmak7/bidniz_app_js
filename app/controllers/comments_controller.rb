class CommentsController < ApplicationController

    def create
        @business = Business.find(params[:business_id])
        @comment = @business.comments.create(params[:comment].permit[:content])
        @comment.user_id = current_user.id
        @comment.business_id = @business.id

        if @comment.save
            redirect_to user_business_path(@business.user, @business)
        else
            render :new
        end

        def destroy

        end
    end
end