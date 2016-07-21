class ProductSerializer < ActiveModel::Serializer
  attributes :id, :label, :color, :price, :size
  has_many :category_ids
end
