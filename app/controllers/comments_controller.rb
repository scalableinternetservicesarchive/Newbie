class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]
	before_action :set_post
	before_action :set_comment, only: [:destroy]
	before_filter :correct_user, only: [:destroy]
	
	def create
		@comment = @post.comments.create(comment_params)
		if @post.user_id == current_user.id
			@comment.read = true
			@comment.save
		end
		redirect_to post_path(@post)
	end

	def destroy
    	@comment.destroy
        redirect_to post_path(@post)
	end

	private
		def comment_params
			params.require(:comment).permit(:content).merge(user_id: current_user.id)
		end

		def set_post
			@post = Post.find(params[:post_id])
		end

		def set_comment
			@comment = @post.comments.find(params[:id])
		end

		def correct_user
			if @comment.user_id != current_user.id
				redirect_to post_path(@post), notice: "No authrity!"
			end
		end
end
