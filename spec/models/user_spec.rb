require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      user = User.new(name: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(name: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "emailの一意性をテスト" do
      user2 = FactoryBot.build(:user, email: @user.email)
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailが空では登録できない' do
      user = User.new(name: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスに@が含まれていない場合、無効であること" do
      @user.email = "testexample.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが空の場合、ユーザーは無効であること" do
      @user.encrypted_password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Encrypted_password can't be blank")
    end
      it "パスワードが6文字未満の場合、ユーザーは無効であること" do
        @user.encrypted_password = "abc12"
        @user.password_confirmation = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted_password is too short (minimum is 6 characters)")
      end

      it "パスワードが英字のみの場合、無効であること" do
        @user.encrypted_password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted_password is invalid")
      end
    
      it "パスワードが数字のみの場合、無効であること" do
        @user.encrypted_password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted_password is invalid")
      end

      it "パスワードとパスワード（確認）が一致しない場合、ユーザーは無効であること" do
        @user.encrypted_password = "password"
        @user.password_confirmation = "different_password"
        @user.valid?
        expect(@user.errors.full_messages).to include("Encrypted_password confirmation doesn't match Password")
      end

      it "名字が空では登録できない" do
        @user.surname_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname_name can't be blank")
      end
    
      it "名前が空では登録できない" do
        @user.name_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name_name can't be blank")
      end
    
      it "名字と名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.surname_name = 'tanaka'
        @user.name_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname_name is invalid", "Name_name is invalid")
      end
    
    
      it "カナ名字が空では登録できない" do
        @user.surname_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname_kana_name kana can't be blank")
      end
    
      it "カナ名前が空では登録できない" do
        @user.kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nana_name kana can't be blank")
      end
    
      it "カナ名字とカナ名前が全角（カタカナ）でなければ登録できない" do
        @user.surname_kana_name = 'たなか'
        @user.kana_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname_kana_name is invalid", "Kana_name kana is invalid")
      end
    
      it "生年月日が空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end