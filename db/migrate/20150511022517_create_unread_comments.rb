class CreateUnreadComments < ActiveRecord::Migration
  def change
    create_table :unread_comments do |t|
    end
  end
end
