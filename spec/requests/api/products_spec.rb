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
        expect(json[i]['label']).to eq products[i].label
        expect(json[i]['color']).to eq products[i].color
        expect(json[i]['price']).to eq products[i].price
        expect(json[i]['size']).to eq products[i].size
        expect(json[i]['category_ids']).to eq products[i].category_ids
      end
    end

    it 'filters products based on query parameters' do
      products = []
      products << FactoryGirl.create(:product, color: "red")
      products << FactoryGirl.create(:product, color: "blue")

      get "/products?color=blue", nil

      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'

      json = JSON.parse(response.body)
      expect(json[0]['label']).to eq products[1].label
      expect(json[0]['color']).to eq products[1].color
      expect(json[0]['price']).to eq products[1].price
      expect(json[0]['size']).to eq products[1].size
      expect(json[0]['category_ids']).to eq products[1].category_ids
      expect(json.length).to eq 1
    end
  end

  describe 'GET /products/:id - Show' do
    it 'sends an individual product' do
      product = FactoryGirl.create(:product)

      get "/products/#{product.id}", nil

      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'

      json = JSON.parse(response.body)
      expect(json['label']).to eq product.label
      expect(json['color']).to eq product.color
      expect(json['price']).to eq product.price
      expect(json['size']).to eq product.size
      expect(json['category_ids']).to eq product.category_ids
    end
  end
end
