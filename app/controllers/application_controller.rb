class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  skip_before_filter :verify_authenticity_token
  before_filter :get_unread

  def get_unread
  	@unread = 0
  	if !current_user.nil?
  		@unread = Unreadcomment.where(user_id: current_user.id).size
    end
  end

end
