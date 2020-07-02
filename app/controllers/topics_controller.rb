class TopicsController < ApplicationController
	before_action :current_topic, only [:show]

	def index
		@topics = Topic.all
	end

	def show
	end
	
	private
	def current_topic
		@topic = Topic.find(params[:id])
	end
end