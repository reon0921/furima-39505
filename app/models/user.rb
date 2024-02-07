class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :password_confirmation, presence: true
  #validate :password_match?
  validates :surname_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :name_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :surname_kana_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :kana_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true


  # user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

