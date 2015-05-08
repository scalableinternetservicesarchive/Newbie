class Post < ActiveRecord::Base
    has_many :comments
    has_many :votes
    has_attached_file :post_image, :styles => { :thumb => "100x100>", :medium => "300x300>"}
    validates_attachment_content_type :post_image, :content_type => ["image/jpg",
                                                                     "image/jpeg", "image/png", "image/gif"]

    acts_as_taggable

    after_save ThinkingSphinx::RealTime.callback_for(:post)
end
