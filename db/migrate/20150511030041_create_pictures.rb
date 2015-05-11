class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
