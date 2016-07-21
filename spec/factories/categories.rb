FactoryGirl.define do
  factory :category do
    name { Faker::Book.genre }
    products { build_list :product_without_category, 3 }

    factory :category_without_product do
      # Avoid a recursive loop between product and category creation
      products []
    end

    factory :invalid_category do
      name nil
    end
  end
end
