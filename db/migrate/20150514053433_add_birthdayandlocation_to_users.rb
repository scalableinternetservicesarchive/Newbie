class AddBirthdayandlocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :datetime
    add_column :users, :location, :string
  end
end
