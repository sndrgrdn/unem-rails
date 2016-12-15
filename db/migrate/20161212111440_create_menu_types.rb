class CreateMenuTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_types do |t|
      t.string :name

      t.timestamps
    end

    add_reference :menus, :menu_type, foreign_key: true
  end
end
