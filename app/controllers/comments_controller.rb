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
	    else
	    	flash[:errors] = @comment.errors.full_messages
	    end
	    
	    redirect_to resource_path(@comment.resource)
	end
	
	private
	def comment_params
		params.require(:comment).permit(:content, :resource_id, :user_id) # FIGURE OUT HOW TO INCLUDE USER_ID
		# params[:user_id] = session[:current_user_id]
	end
end