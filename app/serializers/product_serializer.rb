class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :price, :size
  has_many :category_ids
end
