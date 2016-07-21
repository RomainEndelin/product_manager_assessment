class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  validates :label, presence: true
  validates :color, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :size, presence: true, numericality: { greater_than: 0 }

  include Filterable

  scope :color,    -> (color) { where color: color }
  scope :label,    -> (label) { where("label like ?", "%#{label}%") }
  scope :minprice, -> (price) { where("price >= #{price}") }
  scope :maxprice, -> (price) { where("price <= #{price}") }
  scope :minsize,  -> (size)  { where("size >= #{size}") }
  scope :maxsize,  -> (size)  { where("size <= #{size}") }
end
