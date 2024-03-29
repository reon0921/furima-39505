FactoryBot.define do
  factory :item do
    name { 'テストアイテム' }
    description { 'これはテスト用のアイテムです' }
    price { 1000 }
    association :user
  end
end
