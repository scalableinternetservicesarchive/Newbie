class Post < ActiveRecord::Base
    # favorite posts
    belongs_to :user
    has_many :favorite_posts

    has_many :comments
    has_many :unreadcomments
    has_many :readcomments
    has_many :votes
    has_many :pictures, :dependent => :destroy

    #has_and_belongs_to_many :tags

    acts_as_taggable

    geocoded_by :getAddress,
                :latitude => :latitude, :longitude => :longitude

    after_validation :geocode

    after_save ThinkingSphinx::RealTime.callback_for(:post)

    def getAddress
      if self.address == ''
        self.ip_address
      else
        self.address
      end
    end      
end
