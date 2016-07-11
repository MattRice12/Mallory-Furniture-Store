class Product < ApplicationRecord
  validates :name, length: { minimum: 2, maximum: 80 }
  validates :price, numericality: { only_integer: true }
  validates :condition, length: { minimum: 1, maximum: 200}
  validates :on_clearance, default: false, inclusion: { in: [true, false] }
  validates :quantity, numericality: { only_integer: true }

  def discount
    if on_clearance
      self.price *= 0.9 if condition.downcase == "good"
      self.price *= 0.8 if condition.downcase == "average"
    end
      self.price
  end
end
