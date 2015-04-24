class Post < ActiveRecord::Base
    has_many :comments
    has_attached_file :post_image, :styles => { :thumb => "100x100>"}
    validates_attachment_content_type :post_image, :content_type => ["image/jpg",
        "image/jpeg", "image/png", "image/gif"]
end
