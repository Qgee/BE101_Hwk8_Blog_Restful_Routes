class PostsController < ApplicationController

	def index
		@posts = Post.all
		@post = Post
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

	def create

		if Post.create(title:params[:title],post:params[:post])
			flash[:notice] = "Last Action:  Post Created (Title: #{params[:title]})"
		else
			flash[:alert] = "Last Action: Post could not be created."
		end

		return redirect_to(posts_path)
	end

	def new
		@post = Post
	end

end