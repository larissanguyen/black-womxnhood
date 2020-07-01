class ResourcesController < ApplicationController
	before_action :current_resource, only [:show]

	def index
	end

	def show
	end

	def new
	end

	def create
	end
	
	private
	def resources_params
		params.require(:resource).permit(:title, :author_id, :date_published)
	end

	def current_resource
		@resource = Resource.find(params[:id])
	end
	
end