class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
	end

	def destroy
		@post = Post.find(params[:id])

		if @post.delete
			flash[:notice] = "Last Action: Post Deleted (Title: #{@post.title})"
		else
			flash[:alert] = "Last Action: Could not delete"
		end

		return redirect_to(posts_path)
	end

end