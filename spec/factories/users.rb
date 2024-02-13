FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'abc123' }
    password_confirmation { 'abc123' }
    surname_name { '山田' } 
    name_name { '太郎' }
    surname_kana_name { 'ヤマダ' } 
    kana_name { 'タロウ' } 
    birthday { '2000-01-01' }
  end
end