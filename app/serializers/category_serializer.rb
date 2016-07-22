class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_category_id, :subcategory_ids
  has_many :product_ids

  def subcategory_ids
    object.child_ids
  end

  def parent_category_id
    object.parent_id
  end
end
