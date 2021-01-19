require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
    describe '新規登録/ユーザー情報' do
      context '新規登録がうまくいくとき' do
        it "記入欄の全てが存在すれば登録できること" do
          expect(@user).to be_valid
        end
      end


      context '新規登録がうまくいかないとき' do
        it "ニックネームが必須であること" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nicknameを入力してください")
        end

        it "メールアドレスが必須であること" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end

        it "メールアドレスが一意性であること" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          # binding.pry
          expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
        end

        it "emailは、@を含む必要があること" do
          @user.email = "sample egmail.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールは不正な値です")
        end

        it "パスワードが必須であること" do
          @user.password = ""
          @user.save
          expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end

        it "パスワードは、6文字以上での入力が必須であること" do
          @user.password = "000aa"
          @user.password_confirmation = "000aa"
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
        end

        it "パスワードが半角数字のみの場合登録できないこと" do
          @user.password = "000000"
          @user.password_confirmation = "000000"
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは不正な値です")
        end

        it "パスワードが半角英字のみの場合登録できないこと" do
          @user.password = "aaaaaa"
          @user.password_confirmation = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは不正な値です")
        end

        it "パスワードが全角英数字の場合登録できないこと" do
          @user.password = "００００AA"
          @user.password_confirmation = "００００AA"
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードは不正な値です")
        end

        it "パスワードとパスワード（確認用）、値の一致が必須であること" do
          @user.password = "0000aa"
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
      end
    end
end
