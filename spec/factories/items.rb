FactoryBot.define do
  factory :item do
    name { 'テストアイテム' }
    description { 'これはテスト用のアイテムです' }
    price { 1000 }
    condition_id { 1 }
    availability_id { 1 }
    expected_shipping_date_id { 1 }
    association :user
  end
end
