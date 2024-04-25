FactoryBot.define do
  factory :donation_address do
    post_code { '123-4567' }
    telephone_number { '09012345678' }
    street_address { '青山1-1-1' }
    building_name { '柳ビル103' }
    municipalities { '東京都' }
    user_id { 1 }
    item_id { 1 }
    prefecture_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
