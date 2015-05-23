class AddIndexToReadcomments < ActiveRecord::Migration
  def change
    add_index :readcomments, :user_id
    add_index :readcomments, :comment_id
    add_index :readcomments, :reply_toid
  end
end
