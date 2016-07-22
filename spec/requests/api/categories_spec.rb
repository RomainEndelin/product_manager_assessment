require 'rails_helper'

describe 'Categories API', type: :request do
  describe 'GET /products - Index' do
    it 'sends every categories' do
      category1 = create(:category, parent: nil)
      category2 = create(:category, parent: nil)
      category3 = create(:category, parent: category2)
      categories = [category1, category2, category3]

      get "/categories", nil

      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'

      json = JSON.parse(response.body)
      json_cat1 = json[0]
      expect(json_cat1['id']).to eq category1.id
      expect(json_cat1['name']).to eq category1.name
      expect(json_cat1['product_ids']).to eq category1.product_ids
      expect(json_cat1['subcategories']).to eq []
      json_cat2 = json[1]
      expect(json_cat2['id']).to eq category2.id
      expect(json_cat2['name']).to eq category2.name
      expect(json_cat2['product_ids']).to eq category2.product_ids
      json_cat3 = json[1]['subcategories'][0]
      expect(json_cat3['id']).to eq category3.id
      expect(json_cat3['name']).to eq category3.name
      expect(json_cat3['product_ids']).to eq category3.product_ids
      expect(json_cat3['subcategories']).to eq []
    end
  end

  describe 'GET /products/all - Flat index' do
    it 'sends every categories' do
      category1 = create(:category, parent: nil)
      category2 = create(:category, parent: nil)
      category3 = create(:category, parent: category2)
      categories = [category1, category2, category3]

      get "/categories/all", nil

      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'

      json = JSON.parse(response.body)
      categories.each_with_index do |category, i|
        expect(json[i]['id']).to eq category.id
        expect(json[i]['name']).to eq category.name
        expect(json[i]['parent_category_id']).to eq category.parent_id
        expect(json[i]['subcategory_ids']).to eq category.child_ids
        expect(json[i]['product_ids']).to eq category.product_ids
      end
    end
  end

  describe 'GET /categories/:id - Show' do
    it 'sends an individual category' do
      root = create(:category, parent: nil)
      category = create(:category, parent: root)
      2.times do
        create(:category, parent: category)
      end

      get "/categories/#{category.id}", nil

      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'

      json = JSON.parse(response.body)
      expect(json['name']).to eq category.name
      expect(json['parent_category_id']).to eq category.parent_id
      expect(json['subcategory_ids']).to eq category.child_ids
      expect(json['product_ids']).to eq category.product_ids
    end
  end
end
