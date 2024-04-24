require 'rails_helper'
RSpec.describe DonationAddress, type: :model do  # (1) テストするクラス名を指定
  before do
    @donation_address = FactoryBot.build(:donation_address)
  end
  context '内容に問題ない場合' do
    it "tokenがあれば保存ができること" do
      expect(@donation_address).to be_valid
    end
  end

  

    it "tokenが空では登録できないこと" do
      @donation_address.token = nil
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Token can't be blank")
    end
  end