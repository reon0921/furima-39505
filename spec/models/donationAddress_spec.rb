require 'rails_helper'

RSpec.describe DonationAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @donation_address = FactoryBot.build(:donation_address, user_id: user.id, item_id: item.id)
  end

  context '購入情報が保存できる場合' do
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@donation_address).to be_valid
    end
  end

  context '購入情報が保存できない場合' do
    it 'user_idが空だと保存できないこと' do
      @donation_address.user_id = nil
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと保存できないこと' do
      @donation_address.item_id = nil
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Item can't be blank")
    end

    it 'post_codeが空だと保存できないこと' do
      @donation_address.post_code = nil
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeがハイフン無しでは保存できないこと' do
      @donation_address.post_code = "1234567"
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it 'street_addressが空だと保存できないこと' do
      @donation_address.street_address = nil
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Street address can't be blank")
    end

    it 'telephone_numberが空だと保存できないこと' do
      @donation_address.telephone_number = nil
      @donation_address.valid?
      expect(@donation_address.errors.full_messages).to include("Telephone number can't be blank")
    end
    it 'municipalitiesが空だと保存できないこと' do
        @donation_address.municipalities = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Municipalities can't be blank")
    end

    it 'tokenが空だと保存できないこと' do
        @donation_address.token = nil
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'prefecture_idが0だと保存できないこと' do
        @donation_address.prefecture_id = 0
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'telephone_numberが9桁以下では保存できないこと' do
        @donation_address.telephone_number = '123456789'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Telephone number は10桁以上11桁以下の半角数字で入力してください')
    end

    it 'telephone_numberが12桁以上では保存できないこと' do
        @donation_address.telephone_number = '123456789012'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include('Telephone number は10桁以上11桁以下の半角数字で入力してください')
    end
    it '建物名が空でも保存できること' do
        @donation_address.building_name = ''
        expect(@donation_address).to be_valid 
    end
    it 'telephone_numberに半角数値以外の文字が含まれている場合保存できないこと' do
        @donation_address.telephone_number = 'abcd12345'
        @donation_address.valid?
        expect(@donation_address.errors.full_messages).to include("Telephone number is not a number")
    end
  end
end