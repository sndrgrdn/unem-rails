class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
