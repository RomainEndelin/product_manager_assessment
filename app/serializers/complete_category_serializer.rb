class CompleteCategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :subcategories, :product_ids
  has_many :product_ids
  has_many :subcategories, serializer: CompleteCategorySerializer

  def subcategories
    object.children
  end
end
