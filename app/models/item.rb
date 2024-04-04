class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :availability
  belongs_to :expected_shipping_date
  belongs_to :prefecture
  belongs_to :user

  
  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :availability_id, presence: true
  validates :expected_shipping_date_id, presence: true
  validates :prefecture_id, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :availability_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :expected_shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, numericality: { only_integer: true }
  validates :image, presence: true
  def sold_out?
  end
  #validates :your_attribute, numericality: { only_integer: true }
end
