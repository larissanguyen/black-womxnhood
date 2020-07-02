class TopicsController < ApplicationController
	before_action :current_topic, only: [:show]
	skip_before_action  :authenticated

	def index
		@topics = Topic.all
	end

	def show
	end
	
	private
	def topics_params
		params.require(:resource).permit(:nsme, :description)
	end

	def current_topic
		@topic = Topic.find(params[:id])
	end
end