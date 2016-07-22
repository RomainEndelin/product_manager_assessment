class Category < ApplicationRecord
  has_and_belongs_to_many :products
  acts_as_tree order: :name
  validates :name, presence: true
  validate :loop_validation

  def loop_validation
    if loops?(self)
      errors.add(:parent, "can't loop over parent categories")
    end
  end

  protected

    def loops?(reference)
      if parent.nil?
        return false
      elsif parent == reference
        return true
      end
      return parent.loops?(reference)
    end
end
