class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :get_unread
  protect_from_forgery with: :exception
  
  def get_unread
  	if !current_user.nil?
  	
  	@posts = Post.where(user_id: current_user.id)
  	@post_unread = Hash.new
  	@unread = 0
  	@posts.each do |p|
  		@tmp = Comment.where(post_id: p.id, read: false)
  		@unread += @tmp.size
  	end

  	
    end
  end


end
