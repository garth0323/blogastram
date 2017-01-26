class PostsController < ApplicationController
	before_filter :authenticate_user!, except: [:index]

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def show
		@post = Post.find params[:id]
		@comments = @post.comments.all.order('created_at')
		@comment = Comment.new
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
    @post.user = current_user
		if @post.save!
			redirect_to post_path(@post)
		else
			flash[:notice] = "Something went wrong, try again."
			render :new
		end
	end

	def create_comment
		@post = Post.find params[:id]
		@comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
		if @comment.save!
			redirect_to post_path(@post)
		else
			flash[:notice] = "Something went wrong, try again."
			post_path(@post)
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def comment_params
		params.require(:comment).permit(:body)
	end

end