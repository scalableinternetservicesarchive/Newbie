class Comment < ActiveRecord::Base
  belongs_to :post

  def findUser()
    @user = User.find(self.user_id)
  end

end
