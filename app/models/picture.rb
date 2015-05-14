class Picture < ActiveRecord::Base
    belongs_to :post
    has_attached_file :image, :styles => { :medium => "600x" }
    do_not_validate_attachment_file_type :image
end
