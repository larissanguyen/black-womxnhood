class AuthorsController < ApplicationController
	before_action :current_author, only [:show]

	def index
	end

	def show
	end
	
	private
	def current_author
		@author = Author.find(params[:id])
	end
end