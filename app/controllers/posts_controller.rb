class PostsController < ApplicationController
	def new
		@user = User.find(session[:user_id])
		@post = @user.posts.new
	end

	def create
		@user = User.find(session[:user_id])
		@post = @user.posts.build(post_params)
		if @post.save
			redirect_to user_path(@user)
		else
			render :new
		end
	end

private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
	    params.require(:post).permit(:title, :body, :user_id)
	end
end
