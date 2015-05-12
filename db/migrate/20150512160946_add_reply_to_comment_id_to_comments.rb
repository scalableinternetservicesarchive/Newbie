class AddReplyToCommentIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :replyToCommentID, :integer
  end
end
