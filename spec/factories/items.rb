FactoryBot.define do
  factory :item do
    name { "テスト商品名" }
    description { "テスト商品説明" }
    price { 1000 }
    association :user
    category_id { 2 }
    condition_id { 2 }
    availability_id { 2 }
    expected_shipping_date_id { 2 }
    prefecture_id { 2 }
  end
end