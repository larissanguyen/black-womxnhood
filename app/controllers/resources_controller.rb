class ResourcesController < ApplicationController
	before_action :current_resource, only: [:show]
	skip_before_action  :authenticated

	def index
		@resources = Resource.all
	end

	def show
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

		#check if user is writing dog's name or not
        unless params[:resource][:topic][:name].empty? 
            topic = Topic.create(topics_params) # calling strongs params
        end

        unless params[:resource][:author][:name].empty? 
            author = Author.create(author_params) # calling strongs params
            byebug
            @resource.author_id = author.id
        end

        unless params[:resource][:comment][:content].empty? 
            comment = Comment.create(comment_params) # calling strongs params
            comment.resource_id = @resource.id
        end

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
										 {:author => [:name, :bio]}, 
										 :topic_ids, 
										 {:topic => [:name]}, 
										 {:comment => [:content]})
	end

	def topics_params
		params.require(:resource).permit({:topic => [:name]})[:topic]
	end

	def author_params
		params.require(:resource).permit(:author_id, {:author => [:name, :bio]})[:name]
	end

	def upvote_params
		params.require(:resource).permit(:user_id, :resource_id)
	end

	def comment_params
		params.require(:resource).permit({:comment => [:content]})[:comment]
	end

	def current_resource
		@resource = Resource.find(params[:id])
	end
	
end