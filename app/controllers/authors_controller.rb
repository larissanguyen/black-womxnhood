class AuthorsController < ApplicationController
	before_action :current_author, only: [:show]
	skip_before_action  :authenticated

	def index
	end

	def show
	end
	
	private
	def current_author
		@author = Author.find(params[:id])
	end
end