class Item < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :availability_id, presence: true
  validates :expected_shipping_date_id, presence: true
  validates :prefecture_id, presence: true
  

end
