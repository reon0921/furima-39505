class User < ApplicationRecord
  #validates :name, presence: true
  #validates :email, presence: true
  #validates :email, presence: true, uniqueness: true
  #validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "は有効なメールアドレスの形式で入力してください" }
  #validates :password, presence: true
  #validates :password, presence: true, length: { minimum: 6 }
  #validates :password, presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "は半角英数字混合で入力してください" }
  #validates :password, presence: true
  #validates :password_confirmation, presence: true
  #validates_confirmation_of :password
  #validates :name_name, presence: true
  #validates :first_name, presence: true
  #validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角で入力してください" }
  #validates :first_name_kana, presence: true
  #validates :name_kana, presence: true, format: { with: /\A[ァ-ンー－]+\z/, message: "は全角カタカナで入力してください" }
  #validates :birthday, presence: true
  
  # user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

