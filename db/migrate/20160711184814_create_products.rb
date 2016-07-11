class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :condition, null: false
      t.boolean :on_clearance, default: false, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
