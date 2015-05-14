class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :comment_id
      t.boolean :to_post
      t.integer :reply_to_id

      t.timestamps null: false
    end
  end
end
