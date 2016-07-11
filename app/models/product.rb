class Product < ApplicationRecord
  validates :name, length: { minimum: 2, maximum: 80 }
  validates :price, presence: true
  validates :condition, length: { minimum: 1, maximum: 200}
  validates :on_clearance, default: false, inclusion: { in: [true, false] }
  validates :quantity, presence: true
end
