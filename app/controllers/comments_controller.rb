class CommentsController < ApplicationController

    def create
        @business = Business.find(params[:business_id])
        @comment = @business.comments.create(comment_params)
        @comment.user_id = current_user.id
        @comment.business_id = @business.id

        if @comment.save
            redirect_to user_business_path(@business.user_id, @business)
        else
            render :new
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :business_id)
    end

end