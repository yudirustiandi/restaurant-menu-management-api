class CreateMenuItems < ActiveRecord::Migration[8.1]
  def change
    create_table :menu_items do |t|
      t.string :name, null: false
      t.string :description
      t.decimal :price, null: false
      t.string :category
      t.boolean :is_available, default: true
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
