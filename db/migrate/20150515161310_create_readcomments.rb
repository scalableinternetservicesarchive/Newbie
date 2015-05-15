class CreateReadcomments < ActiveRecord::Migration
  def change
    create_table :readcomments do |t|
      t.integer :user_id
      t.integer :comment_id
      t.boolean :to_post
      t.integer :reply_toid

      t.timestamps null: false
    end
  end
end
