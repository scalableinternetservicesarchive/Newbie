class UpdateUserUnread < ActiveRecord::Migration
  def change
    change_column :users, :unread, :integer, default: 0, null: false
  end
end
