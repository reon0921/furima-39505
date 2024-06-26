class DonationAddress
  include ActiveModel::Model
  attr_accessor :post_code, :telephone_number, :city, :street_address, :building_name, :price, :user_id,:item_id, :donation_id, :phone_number,:prefecture_id,:item,:purchase,:municipalities,:token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :street_address
    validates :municipalities
    validates :telephone_number, numericality: { only_integer: true, message: 'は10桁以上11桁以下の半角数字で入力してください' }
  end
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    recipient = Recipient.create(post_code: post_code, prefecture_id: prefecture_id, street_address: street_address, telephone_number: telephone_number,  building_name: building_name, purchase_id: purchase.id, municipalities: municipalities)
  end
end