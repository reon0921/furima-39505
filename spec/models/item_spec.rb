require 'rails_helper'
user = FactoryBot.create(:user)
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  it "全ての項目が存在すれば登録できること" do
    expect(@item).to be_valid
  end

  it "nameが空では登録できないこと" do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it "descriptionが空では登録できないこと" do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end

  it "priceが空では登録できないこと" do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it "category_idが空では登録できないこと" do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it "condition_idが空では登録できないこと" do
    @item.condition_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end

  it "availability_idが空では登録できないこと" do
    @item.availability_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Availability can't be blank")
  end

  it "expected_shipping_date_idが空では登録できない" do
    @item.expected_shipping_date_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Expected shipping date can't be blank")
  end

  it "prefecture_idが空では登録できない" do
    @item.prefecture_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end

  it '商品名が40文字以下なら有効であること' do
    item = FactoryBot.build(:item, name: 'a' * 40)
    expect(item).to be_valid
  end


  it '商品説明が1000文字以内なら有効であること' do
    item = FactoryBot.build(:item, description: 'a' * 1000)
    expect(item).to be_valid
  end
end