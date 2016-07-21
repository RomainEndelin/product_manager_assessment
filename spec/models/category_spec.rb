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
end
