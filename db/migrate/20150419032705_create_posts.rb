class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.datetime :datetime
      t.text :content
      t.string :image_url
      t.integer :downvote_number
      t.integer :upvote_number

      t.timestamps null: false
    end
  end
end
