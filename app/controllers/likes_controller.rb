class LikesController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@like = @user.likes.new(like_params)
		if @like.save
			flash[:notice] = @like.errors.full_messages.to_sentence
		end
			redirect_to @like.post
	end

	def destroy
		@user = User.find(params[:user_id])
		@like = @user.likes.find(params[:id])
		post = @like.post
		@like.destroy
		redirect_to post
	end


	private
	 def like_params

	 	params.require(:like).permit(:likeable_id, :likeable_type)
	 end
end
