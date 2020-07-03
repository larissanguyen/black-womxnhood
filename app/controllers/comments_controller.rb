class CommentsController < ApplicationController
	skip_before_action  :authenticated

	def new
		@comment = Comment.new
		@resources = Resource.all
	end

	def create
		@comment = Comment.new(comment_params)

	    if @comment.valid?
	    	@comment.save
	    	redirect_to new_resource_path
	    else
	    	flash[:errors] = @comment.errors.full_messages
	    	redirect_to new_comment_path
	    end
	end
	
	private
	def comment_params
		params.require(:comment).permit(:content, :resource_id, :user_id) # FIGURE OUT HOW TO INCLUDE USER_ID
		params[:user_id] = session[:current_user_id]
	end
end