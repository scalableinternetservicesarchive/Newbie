class Post < ActiveRecord::Base
  #before_save :default_values
    has_many :comments
    has_many :votes
    has_attached_file :post_image, :styles => { :thumb => "100x100>", :medium => "300x300>"}
    validates_attachment_content_type :post_image, :content_type => ["image/jpg",
                                                                     "image/jpeg", "image/png", "image/gif"]

    acts_as_taggable

    geocoded_by :ipaddress,
    :latitude => :latitude, :longitude => :longitude
    after_validation :geocode

    after_save ThinkingSphinx::RealTime.callback_for(:post)

    #def default_values
      #self.downvote_number = 0
      #self.upvote_number = 0
    #end
end
