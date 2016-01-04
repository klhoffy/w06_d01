class CommentsController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@comment = current_user.comments.new
	end

	def create
		@user = User.find(params[:user_id])
		@comment = Comment.new(comment_params)
		if @comment.save
			redirect_to user_path(@comment.post.user)
		else
			render :new
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:body, :user_id, :post_id)
		end
end
