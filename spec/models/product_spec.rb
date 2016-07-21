require 'rails_helper'

describe Product do
  it 'is valid with correct attributes' do
    expect(build(:product)).to be_valid
  end

  it 'is invalid without a name' do
    product = build(:product, name: nil)
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
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

end
