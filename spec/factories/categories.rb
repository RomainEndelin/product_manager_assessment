FactoryGirl.define do
  factory :category do
    name { Faker::Book.genre }

    # after(:build) do |category|
    #   [:product1, :product1].each do |product|
    #     category.products << FactoryGirl.build(:product,
    #                                            name: product)
    #   end
    # end

    # factory :subcategory do
    #   after(:build) do |subcategory|
    #     subcategory.parent_category = FactoryGirl.build(:category)
    #   end
    # end

    factory :invalid_category do
      name nil
    end
  end
end
