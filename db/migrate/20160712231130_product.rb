class Product < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :category, index: true
    add_foreign_key :products, :category
  end
end
