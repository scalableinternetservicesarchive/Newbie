class AddLatitudeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :latitude, :string
  end
end
