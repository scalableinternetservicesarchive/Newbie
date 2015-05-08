class AddLongitudeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :longitude, :string
  end
end
