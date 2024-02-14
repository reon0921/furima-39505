require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it '全ての項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end
    context '新規登録ができない時' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it 'メールアドレスが一意であること' do
      # 別のユーザーと同じメールアドレスの設定
      FactoryBot.create(:user, email: 'test@example.com')
      @user.email = 'test@example.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
    
    it "パスワードが空の場合、ユーザーは無効であること" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
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
        expect(@user.errors.full_messages).to include("Surname name can't be blank") 
      end
    
      it "名前が空では登録できない" do
        @user.name_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name name can't be blank")
      end
    
      it "名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.surname_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname name is invalid")
      end

      it "名字と全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.name_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name name is invalid")
      end
    
      it "カナ名字が空では登録できない" do
        @user.surname_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname kana name can't be blank")
      end
    
      it "カナ名前が空では登録できない" do
        @user.kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana name can't be blank")
      end
    
      it "お名前カナは全角（カタカナ）でなければ無効であること" do
        @user.kana_name = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana name is invalid")
      end
    
      it "生年月日が空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end



      it 'パスワードが全角では登録できない' do
        @user.password = 'パスワード'
        @user.password_confirmation = 'パスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it '名字が全角では登録できない' do
        @user.surname_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it 'メールアドレスに@が含まれていない場合、登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      end
    end
    