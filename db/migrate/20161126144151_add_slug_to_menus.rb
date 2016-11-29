class AddSlugToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :slug, :string
    add_index :menus, [:restaurant_id, :slug], unique: true
  end
end
