class AddImageToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :image_uid, :string
    add_column :restaurants, :image_name, :string
  end
end
