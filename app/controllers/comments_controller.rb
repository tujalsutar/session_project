class CommentsController < ApplicationController


  # def new
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.new(parent_id: params[:parent_id])
  # end
	def create
    # byebug
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
      @comment.user_id = Current.user.id
      @comment.name = Current.user.first_name
      @comment.save
     redirect_back(fallback_location: @post)
  end

  private
    def comment_params
      params.require(:comment).permit(:comment, :user_id)
    end
end
