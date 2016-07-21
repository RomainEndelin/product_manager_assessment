class Product < ApplicationRecord
  validates :name, presence: true
  validates :color, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :size, presence: true, numericality: { greater_than: 0 }
end
