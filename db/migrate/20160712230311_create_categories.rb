class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text :title, null: false
      t.string :cat_url
      t.timestamps
    end
  end
end
