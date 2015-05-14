class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :get_unread
  protect_from_forgery with: :exception

  def get_unread
  	@unread = Unreadcomment.where(user_id: current_user.id).size
  end


end
