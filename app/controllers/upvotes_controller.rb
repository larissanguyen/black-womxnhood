class UpvotesController < ApplicationController
	skip_before_action  :authenticated

	def new
		@upvote = Upvote.new
	end

	def create
		@upvote = Upvote.new(upvote_params)

	    if @upvote.valid?
	      @upvote.save
	    else
	      redirect_to "/resource/new"
	    end
	end
	
end