FactoryGirl.define do
  factory :category do
    name { Faker::Book.genre }
    products { build_list :product_without_category, 3 }

    # factory :subcategory do
    #   after(:build) do |subcategory|
    #     subcategory.parent_category = FactoryGirl.build(:category)
    #   end
    # end

    factory :category_without_product do
      # Avoid a recursive loop between product and category creation
      products []
    end

    factory :invalid_category do
      name nil
    end
  end
end
