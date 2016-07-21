require 'rails_helper'

describe 'Products API', type: :request do
  it 'sends an individual product' do
    product = FactoryGirl.create(:product)

    get "/products/#{product.id}", nil

    expect(response).to have_http_status(:success)
    expect(response.header['Content-Type']).to include 'application/json'

    json = JSON.parse(response.body)
    expect(json['name']).to eq product.name
    expect(json['color']).to eq product.color
    expect(json['price']).to eq product.price
    expect(json['size']).to eq product.size
    expect(json['category_ids']).to eq product.category_ids
  end
end
