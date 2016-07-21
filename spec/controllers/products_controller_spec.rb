require 'rails_helper'

describe ProductsController do
  # Controllers testing are rather deprecated in Rails 5.
  # But for the complex case of product#index, I consider it is the best place
  #   to test the filters on products#index.
  # I might test scopes on the model, but "TDD is about specifying behavior, not
  #   structure": http://blog.davidchelimsky.net/blog/2012/02/12/validations-are-behavior-associations-are-structure/

  describe 'GET #index' do
    before :each do
      @product1 = create(:product, color: "blue", label: "long dress", price: 30, size: 30)
      @product2 = create(:product, color: "blue", label: "dress", price: 50, size: 50)
      @product3 = create(:product, color: "red", label: "dress for summer", price: 40, size: 40)
      @product4 = create(:product, color: "green", label: "pants", price: 70, size: 70)
      @product5 = create(:product, color: "green", label: "pants", price: 20, size: 20)
    end

    it 'returns everything with no filter' do
      get :index
      expect(assigns(:products)).to match_array [
        @product1, @product2, @product3, @product4, @product5
      ]
    end

    it 'returns nothing when filter has no match' do
      get :index, params: {color: "grey"}
      expect(assigns(:products)).to eq []
    end

    it 'returns only blue products when queried' do
      get :index, params: {color: "blue"}
      expect(assigns(:products)).to match_array [
        @product1, @product2
      ]
    end

    it 'returns only matching labels when queried' do
      get :index, params: {label: "dress"}
      expect(assigns(:products)).to match_array [
        @product1, @product2, @product3
      ]
    end

    it 'gives a min bound to the price when queried' do
      get :index, params: {minprice: 30}
      expect(assigns(:products)).to match_array [
        @product1, @product2, @product3, @product4
      ]
    end

    it 'gives a max bound to the price when queried' do
      get :index, params: {maxprice: 50}
      expect(assigns(:products)).to match_array [
        @product1, @product2, @product3, @product5
      ]
    end

    it 'gives a min and max bound to the price when queried' do
      get :index, params: {minprice: 30, maxprice: 50}
      expect(assigns(:products)).to match_array [
        @product1, @product2, @product3
      ]
    end

    it 'gives a min bound to the size when queried' do
      get :index, params: {minsize: 30}
      expect(assigns(:products)).to match_array [
        @product1, @product2, @product3, @product4
      ]
    end

    it 'gives a max bound to the size when queried' do
      get :index, params: {maxsize: 50}
      expect(assigns(:products)).to match_array [
        @product1, @product2, @product3, @product5
      ]
    end

    it 'gives a min and max bound to the size when queried' do
      get :index, params: {minsize: 30, maxsize: 50}
      expect(assigns(:products)).to match_array [
        @product1, @product2, @product3
      ]
    end

    it 'filters with combination of parameters' do
      get :index, params: {color: "green", label: "pants", minsize: 20, maxsize: 20, minprice: 20, maxprice: 20}
      expect(assigns(:products)).to eq [@product5]
    end
  end
end
