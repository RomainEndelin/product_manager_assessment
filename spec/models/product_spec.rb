require 'rails_helper'

describe Product do
  it 'is valid with correct attributes' do
    expect(build(:product)).to be_valid
  end

  it 'is invalid without a label' do
    product = build(:product, label: nil)
    product.valid?
    expect(product.errors[:label]).to include("can't be blank")
  end

  it 'is invalid without a color' do
    product = build(:product, color: nil)
    product.valid?
    expect(product.errors[:color]).to include("can't be blank")
  end

  it 'is invalid without a size' do
    product = build(:product, size: nil)
    product.valid?
    expect(product.errors[:size]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    product = build(:product, price: nil)
    product.valid?
    expect(product.errors[:price]).to include("can't be blank")
  end

  it 'is invalid with a negative size' do
    product = build(:product, size: -1)
    product.valid?
    expect(product.errors[:size]).to include("must be greater than 0")
  end

  it 'is invalid with a negative price' do
    product = build(:product, price: -1)
    product.valid?
    expect(product.errors[:price]).to include("must be greater than 0")
  end

  describe 'Category association' do
    it 'is valid with no category' do
      product = build(:product_without_category)
      expect(product.categories.count).to eq 0
    end

    it 'is valid with multiple categories' do
      product = build(:product_without_category)
      product.categories << build(:category)
      product.categories << build(:category)
      expect(product.categories.length).to eq 2
    end
  end
end
