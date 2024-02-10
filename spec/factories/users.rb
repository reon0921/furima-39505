FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    surname_name { '山田' } 
    name_name { '太郎' }
    surname_kana_name { 'ヤマダ' } 
    kana_name { 'タロウ' } 
    birthday { '2000-01-01' }
  end
end