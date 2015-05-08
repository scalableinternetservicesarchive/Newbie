class AddDownVoteNumberToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :downvote_number
    remove_column :posts, :upvote_number
    add_column :posts, :downvote_number, :integer, { default:0}
    add_column :posts, :upvote_number, :integer, { default:0}
  end
end
