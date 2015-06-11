class HomeController < ApplicationController

	def index
		@posts = Post.all
	end

	def post_details 
		@posts = Post.all
	end

end