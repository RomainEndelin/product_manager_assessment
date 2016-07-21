FactoryGirl.define do
  factory :product do
    name { Faker::Book.title }
    size { Faker::Number.between(1, 1000) }
    color { Faker::Color.color_name }
    price { Faker::Number.decimal(2) }

    # after(:build) do |product|
    #   [:category1, :category2].each do |category|
    #     product.categories << FactoryGirl.build(:category,
    #                                             name: category)
    #   end
    # end

    factory :invalid_product do
      name nil
    end
  end
end
