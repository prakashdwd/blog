class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
		@category = Category.all
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to posts_url
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
		@category = Category.all
	end

	def update
		@post = Post.find(params[:id])
		begin			
	  		@post.update!(post_params)
	  		redirect_to post_path(@post)
	  	rescue
	  		render :edit
	  	end 		
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
  		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:title , :body , :category_id)
	end	
end
