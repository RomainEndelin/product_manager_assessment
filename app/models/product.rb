class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  validates :name, presence: true
  validates :color, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :size, presence: true, numericality: { greater_than: 0 }

end
