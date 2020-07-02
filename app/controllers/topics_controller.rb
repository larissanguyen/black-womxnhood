class TopicsController < ApplicationController
	before_action :current_topic, only: [:show]
	# skip_before_action :authenticated, only: [:show, :index]

	def index
		@topics = Topic.all
	end

	def show
		@top_resources = @topic.top_resources
	end
	
	private
	def topics_params
		params.require(:resource).permit(:nsme, :description)
	end

	def current_topic
		@topic = Topic.find(params[:id])
	end
end