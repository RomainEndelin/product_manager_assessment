require 'rails_helper'

describe 'Categories API', type: :request do
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
