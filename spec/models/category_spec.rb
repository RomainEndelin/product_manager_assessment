require 'rails_helper'

describe Category do
  it 'is valid with correct attributes' do
    expect(build(:category)).to be_valid
  end

  it 'is invalid without a name' do
    category = build(:category, name: nil)
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end

  describe 'Product association' do
    it 'is valid with no product' do
      category = build(:category_without_product)
      expect(category.products.count).to eq 0
    end

    it 'is valid with multiple products' do
      category = build(:category_without_product)
      category.products << build(:product)
      category.products << build(:product)
      expect(category.products.length).to eq 2
    end
  end
end
