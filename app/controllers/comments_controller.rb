class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]
	before_action :set_post
	before_action :set_comment, only: [:destroy]
	before_filter :correct_user, only: [:destroy]
	
	def create
		@comment = @post.comments.create(comment_params)
		if @comment.replyToCommentID.nil? && current_user.id!=@post.user_id
			Unreadcomment.create(:user_id => @post.user_id, :comment_id => @comment.id, :to_post => true, :reply_toid => @post.id)
		elsif !@comment.replyToCommentID.nil?
			Unreadcomment.create(:user_id => Comment.find(@comment.replyToCommentID).user_id, :comment_id => @comment.id, :to_post => false, :reply_toid => @comment.replyToCommentID)
		end

		redirect_to post_path(@post)
	end

	def destroy
		@read_comm = Readcomment.where(comment_id: @comment.id)
		@read_comm.each do |r|
			Readcomment.delete(r.id)
		end
		@unread_comm = Unreadcomment.wher(comment_id: @comment.id)
		@unread_comm.each do |u|
			Unreadcomment.delete(u.id)
		end
    	@comment.destroy
        redirect_to post_path(@post)
	end

	private
		def comment_params
			params.require(:comment).permit(:content, :replyToCommentID).merge(user_id: current_user.id)
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
