class AnswersController < ApplicationController

	def new
		@answer = Answer.new
	end
	def create
    @comment = Comment.find(params[:comment_id])
    @answer = @comment.answers.new(reply_params)
    @answer.user_id = Current.user.id
    @answer.save
    render root_path
    # redirect_to 'show'
  end

  private
    def reply_params
      params.require(:answer).permit(:reply, :user_id)
    end
end
