FactoryGirl.define do
  factory :product do
    name { Faker::Book.title }
    size { Faker::Number.between(1, 1000) }
    color { Faker::Color.color_name }
    price { Faker::Number.decimal(2) }
    categories { build_list :category_without_product, 3 }

    factory :product_without_category do
      # Avoid a recursive loop between product and category creation
      categories []
    end

    factory :invalid_product do
      name nil
    end
  end
end
