class CreateMenuTypeSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_type_searches do |t|
      t.string :searchable
      t.references :menu_type, foreign_key: true

      t.timestamps
    end
    add_index :menu_type_searches, :searchable
  end
end
