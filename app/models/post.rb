class Post < ActiveRecord::Base
	has_many :comments
    has_attached_file :post_image, :styles => { :thumb => "100x100>"}
end
