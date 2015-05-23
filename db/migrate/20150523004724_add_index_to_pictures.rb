class AddIndexToPictures < ActiveRecord::Migration
  def change
    add_index :pictures, :post_id
  end
end
