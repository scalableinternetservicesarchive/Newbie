class IndexFavoritePostsOnPostId < ActiveRecord::Migration
  def change
    add_index :favorite_posts, :post_id
    add_index :favorite_posts, :user_id
  end
end
