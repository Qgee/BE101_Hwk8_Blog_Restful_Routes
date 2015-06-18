class PostsController < ApplicationController

	def index
		@posts = Post.all
		@post = Post.new
	end

	def show
		@post = Post.find_by_id(params[:id])
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
			
		@post = Post.new post_params

		if @post.save
			flash[:notice] = "Last Action:  Post Created (Title: #{post_params[:title]})"
		else
			flash[:alert] = "Last Action: Post could not be created."
		end

		return redirect_to(post_path(@post))
	end

	# Helpful: http://stackoverflow.com/questions/25845518/active-model-forbidden-attributes-error

	private

	def post_params
		params.require(:post).permit(:title, :post)
	end

	def new
		@post = Post.new
	end

end