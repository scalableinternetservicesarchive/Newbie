class AddProfilesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_column :users, :gender, :boolean
  end
end
