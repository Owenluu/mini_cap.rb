class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  def is_discounted?
    price <= 200
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
