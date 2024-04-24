FactoryBot.define do
  factory :donation_address do
    user_id { 1 }
    post_code { "123-4567" }
    street_address { "青山1-1-1" }
    telephone_number { "09012345678" }
    municipalities { "東京都" }
    token { "tok_abcdefghijk00000000000000000" }
    prefecture_id { 2 }
    price { 3000 }   
  end
end
