class AddIpAddressToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :ipaddress, :string
  end
end
