class Category < ApplicationRecord
  has_and_belongs_to_many :products
  acts_as_tree order: :name
  validates :name, presence: true
end
