class AddIndexToUnreadcomments < ActiveRecord::Migration
  def change
    add_index :unreadcomments, :comment_id
    add_index :unreadcomments, :reply_toid
    add_index :unreadcomments, :user_id
  end
end
