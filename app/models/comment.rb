class Comment < ActiveRecord::Base
  belongs_to :post

  def findUser(user_id)
    @user = User.find(user_id)
  end

end
