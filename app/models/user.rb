class User < ApplicationRecord
  validates :name, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :surname_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :name_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :surname_kana_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :kana_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

