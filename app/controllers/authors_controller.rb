class AuthorsController < ApplicationController
	before_action :current_author, only: [:show]
	skip_before_action  :authenticated

	def index
		@authors = Author.all
	end

	def new
		@author = Author.new
	end

	def create
		@author = Author.new(author_params)

		if @author.valid?
			@author.save
			redirect_to @author
		else
			flash[:errors] = @author.errors.full_messages
			redirect_to new_author_path
		end
	end

	def show
	end
	
	private
	def author_params
		params.require(:author).permit(:name, :bio)
	end

	def current_author
		@author = Author.find(params[:id])
	end
end