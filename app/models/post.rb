class Post < ActiveRecord::Base
    # favorite posts
    belongs_to :user
    has_many :favorite_posts
    has_many :favorited_by, through: :favorite_posts, source: :user

    has_many :comments
    has_many :votes
    has_many :pictures, :dependent => :destroy

    acts_as_taggable

    geocoded_by :getAddress,
                :latitude => :latitude, :longitude => :longitude

    after_validation :geocode

    after_save ThinkingSphinx::RealTime.callback_for(:post)

    def getComments()
      @comments = Comment.where(post_id: self.id)
    end

    def getUser()
      @user = User.find(self.user_id)
    end

    def getAddress
      if self.address == ''
        self.ip_address
      else
        self.address
      end
    end      
end
