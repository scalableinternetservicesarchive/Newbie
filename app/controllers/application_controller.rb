class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :get_unread, :get_read
  protect_from_forgery with: :exception

  def get_unread
  	@unread = 0
  	if !current_user.nil?
  		@unread = Unreadcomment.where(user_id: current_user.id).size
    end
  end

  def get_read
  	@read = 0
  	if !current_user.nil?
  		@read = Readcomment.where(user_id: current_user.id).size
    end
  end

end
