class AddColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :prod_url, :string
    add_column :products, :category_id, :integer
    add_column :products, :category_id, :index
  end
end
