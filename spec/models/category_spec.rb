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
    it 'has no product by default' do
      category = build(:category_without_product)
      expect(category.products.length).to eq 0
    end

    it 'can include multiple products' do
      category = build(:category_without_product)
      category.products << build(:product)
      category.products << build(:product)
      expect(category.products.length).to eq 2
    end
  end

  describe 'Hierarchical categories' do
    it 'is valid without parent category' do
      expect(build(:category, parent: nil)).to be_valid
    end

    it 'can be attached to a parent category' do
      parent = build(:category)
      expect(build(:category, parent: parent)).to be_valid
    end

    it 'has no subcategories by default' do
      category = build(:category)
      expect(category.children.length).to eq 0
    end

    it 'can be include multiple subcategories' do
      category = build(:category, children: [])
      category.children << build(:category)
      category.children << build(:category)
      expect(category.children.length).to eq 2
    end
  end
end
