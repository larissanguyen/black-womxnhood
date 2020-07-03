class UpvotesController < ApplicationController
	skip_before_action  :authenticated

	def new
		@upvote = Upvote.new
	end

	def create
		@upvote = Upvote.new(upvotes_params)

	    if @upvote.valid?
	      @upvote.save
	    else
	      redirect_to resource_path(@upvote.resource)
	    end
	end

	private
	def upvotes_params
		params.permit(:resource_id, :user_id)
	end
	
end