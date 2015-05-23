class AddIndexToVotes < ActiveRecord::Migration
  def change
    add_index :votes, :user_id
    add_index :votes, :post_id
  end
end
