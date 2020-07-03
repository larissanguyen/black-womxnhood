class ResourcesController < ApplicationController
	before_action :current_resource, only: [:show]
	skip_before_action  :authenticated

	def index
		@resources = Resource.all
	end

	def show
		@upvote = Upvote.new
	end

	def new
		@resource = Resource.new
		@topics = Topic.all
		@topic = Topic.new
		@authors = Author.all
		@author = Author.new
		@comment = Comment.new
	end

	def create
		@resource = Resource.new(resource_params)

	    if @resource.valid?
	      @resource.save
	      redirect_to @resource
	    else
	      redirect_to "/resource/new"
	    end
	end
	

	# "resource"=>{"title"=>"lindsay", "author_id"=>"1", "author"=>{"name"=>"lin-manuel miranda"}, "topic_ids"=>[""], "topic"=>{"name"=>" nyc"}, "comment"=>{"content"=>"It's great!"}}, "commit"=>"Create Resource"}

	private
	def resource_params
		params.require(:resource).permit(:title, 
										 :author_id, :date_published, 
										 :author, 
										 :topic_ids)
	end

	def current_resource
		@resource = Resource.find(params[:id])
	end
	
end