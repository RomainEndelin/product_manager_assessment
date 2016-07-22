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
      products.each_with_index do |product, i|
        expect(json[i]['id']).to eq product.id
        expect(json[i]['label']).to eq product.label
        expect(json[i]['color']).to eq product.color
        expect(json[i]['price']).to eq product.price
        expect(json[i]['size']).to eq product.size
        expect(json[i]['category_ids']).to eq product.category_ids
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
      expect(json[0]['id']).to eq products[1].id
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
      expect(json['id']).to eq product.id
      expect(json['label']).to eq product.label
      expect(json['color']).to eq product.color
      expect(json['price']).to eq product.price
      expect(json['size']).to eq product.size
      expect(json['category_ids']).to eq product.category_ids
    end
  end

  describe 'POST /products - Create' do
    it 'creates the products and sends it' do
      categories = []
      categories << create(:category, id: 1)
      categories << create(:category, id: 3)
      new_attributes = {
        product: {
          label: 'My product',
          size: 10,
          color: 'blue',
          price: 100,
          category_ids: [1, 3]
        }
      }
      expect {
        post "/products", params: new_attributes, as: :json
      }.to change(Product, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(response.header['Content-Type']).to include 'application/json'

      json = JSON.parse(response.body)
      expect(response.location).to include "products/#{json['id']}"
      expect(json['label']).to eq 'My product'
      expect(json['color']).to eq 'blue'
      expect(json['price']).to eq 100
      expect(json['size']).to eq 10
      expect(json['category_ids']).to eq [1, 3]
    end
  end

  describe 'PATCH /products/:id - Update' do
    it 'Updates the products and sends it' do
      category1 = create(:category)
      category2 = create(:category)
      category3 = create(:category)
      product = create(:product, categories: [category1, category2])
      new_attributes = {
        product: {
          label: 'My updated product',
          size: 10,
          color: 'blue',
          price: 110,
          category_ids: [category1.id, category3.id]
        }
      }
      patch "/products/#{product.id}", params: new_attributes, as: :json

      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'

      json = JSON.parse(response.body)
      expect(json['id']).to eq product.id
      expect(json['label']).to eq 'My updated product'
      expect(json['color']).to eq 'blue'
      expect(json['price']).to eq 110
      expect(json['size']).to eq 10
      expect(json['category_ids']).to eq [category1.id, category3.id]
    end
  end

  describe 'DELETE /products - Destroy' do
    it 'Deletes the product' do
      product = create(:product)
      expect {
        delete "/products/#{product.id}"
      }.to change(Product, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
