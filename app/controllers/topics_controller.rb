class TopicsController < ApplicationController
	before_action :current_topic, only: [:show]
	skip_before_action :authenticated, only: [:show, :index]

	def index
		@topics = Topic.all
	end

	def show
		@top_resources = @topic.top_resources
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new(topics_params)

		if @topic.valid?
			@topic.save
			redirect_to @topic
		else
			flash[:errors] = @topic.errors.full_messages
			redirect_to new_topic_path
		end
	end
	
	private
	def topics_params
		params.require(:resource).permit(:name, :description)
	end

	def current_topic
		@topic = Topic.find(params[:id])
	end
end