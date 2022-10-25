class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.new(post_params)
		if @post.save
			redirect_to user_posts_path
		else
			render 'new'
		end
	end


	def edit
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id])
	end
	def update
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id])
		if @post.present?
			@post.update(post_params)
			render 'show'
		else
			render 'edit'
		end
	end

	# def destroy
	# 	@post = Post.find(params[:id])
	# 	# if @post.user_id == Current.user.id
	# 	if @post.present?
	# 		@post.destroy
	# 		 redirect_to root_path, status: :see_other
	# 	else
	# 		notice ="you can not"
	# 	end

	# end

	private
	def post_params
		params.require(:post).permit(:title, :description,:location, :image)
	end
end
