FactoryBot.define do
  
  factory :item do
    name                    {"test"}
    price                   {"777"}
    text                    {"test"}
    condtion_id             {"1"}
    prefecture_id           {"1"}
    postage_type_id         {"1"}
    days_until_shipping_id  {"1"}
    category_id             {"1"}

    trait :with_image do |item|
      after(:build) do |item|
        item.images << build(:image)
      end
    end
  end
end