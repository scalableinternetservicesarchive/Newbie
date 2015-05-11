class ChangeReadInComments < ActiveRecord::Migration
  def change
    change_column :comments, :read, :boolean, :default => false
  end
end
