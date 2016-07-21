require 'rails_helper'

describe 'Products API', type: :request do
  describe 'GET /products - Index' do
    it 'sends every products' do
      products = []
      2.times do
        products << FactoryGirl.create(:product)
      end

      get "/products", nil

      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'

      json = JSON.parse(response.body)
      2.times do |i|
        expect(json[i]['name']).to eq products[i].name
        expect(json[i]['color']).to eq products[i].color
        expect(json[i]['price']).to eq products[i].price
        expect(json[i]['size']).to eq products[i].size
        expect(json[i]['category_ids']).to eq products[i].category_ids
      end
    end
  end

  describe 'GET /products/:id - Show' do
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
end
