class ResourcesController < ApplicationController
	before_action :current_resource, only: [:show]
	skip_before_action  :authenticated

	def index
		@resources = Resource.all
	end

	def show
		# @resource = Resource.find(session[:user_id])
	end

	def new
		@resource = Resource.new
		@topics = Topic.all
		@authors = Author.all
	end

	def create
		@resource = Resource.new(resource_params)

	    if  @resource.valid?
	      @resource.save
	      redirect_to @resource
	    else
	      redirect_to "/resource/new"
	    end
	end
	
	private
	def resource_params
		params.require(:resource).permit(:title, :author_id, :date_published)
	end

	def current_resource
		@resource = Resource.find(params[:id])
	end
	
end