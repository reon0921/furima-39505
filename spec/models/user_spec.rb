require 'rails_helper'

RSpec.describe User, type: :model do
  

  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        user = User.new(
          name: '名前',
          surname_name: '鈴木',
          name_name: '太郎',
          surname_kana_name: 'スズキ',
          kana_name: 'タロウ',
          birthday: '2000-01-01',
          email: 'test@example.com',
          password: 'abc123',
          password_confirmation: 'abc123'
        )
        expect(user).to be_valid
      end
    end
    it 'emailが空では登録できない' do
      user = User.new(name: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

      it 'メールアドレスが一意であること' do
        @user = FactoryBot.build(:user, email: @user.email)
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
    end


    it "パスワードが空の場合、ユーザーは無効であること" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
      it "パスワードが6文字未満の場合、ユーザーは無効であること" do
        @user.password = "abc12"
        @user.password_confirmation = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードが英字のみの場合、無効であること" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    
      it "パスワードが数字のみの場合、無効であること" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードとパスワード（確認）が一致しない場合、ユーザーは無効であること" do
        @user.password = "password"
        @user.password_confirmation = "different_password"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "名字が空では登録できない" do
        @user.surname_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank") 
      end
    
      it "名前が空では登録できない" do
        @user.name_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
    
      it "名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.surname_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.surname_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "名前が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.name_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
    
      it "カナ名字が空では登録できない" do
        @user.surname_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
    
      it "カナ名前が空では登録できない" do
        @user.kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana name can't be blank")
      end
    
      it "お名前カナは全角（カタカナ）でなければ無効であること" do
        @user.kana_name = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
    
      it "生年月日が空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'パスワードが半角英数字であれば保存できる' do
        user = User.new(
          name: '名前',
          surname_name: '鈴木',
          name_name: '太郎',
          surname_kana_name: 'スズキ',
          kana_name: 'タロウ',
          birthday: '2000-01-01',
          email: 'test@example.com',
          password: 'abc123',
          password_confirmation: 'abc123'
        )
        expect(user).to be_valid
      end
      end
    end