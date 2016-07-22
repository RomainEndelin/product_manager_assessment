Rails.application.routes.draw do
  resources :categories do
    get 'all', on: :collection
  end
  resources :products
end
