require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @tweet = FactoryBot.create(:tweet)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, tweet_id: @tweet.id)
    # @order_address.user_id = @user.id
    # @order_address.tweet_id = @tweet.id
    sleep(0.05)
  end

  describe '商品購入機能' do
    context '住所が登録できるとき' do
      it "記入欄の全てを正しく記述すれば登録できること" do
        expect(@order_address).to be_valid
      end

      it "建物名が空でも登録できること" do
        @order_address.building_name = ""
        @order_address.valid?
      end

    end

    context '住所が登録できないとき' do
      it "郵便番号が必須であること" do
        @order_address.post_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post codeを入力してください")
      end

      it "郵便番号にハイフンがないと登録できない" do
        @order_address.post_code = "0001111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post codeは不正な値です")
      end

      it "都道府県が1（---）の場合出品できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectureは1以外の値にしてください")
      end

      it "市区町村が必須であること" do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include( "Cityを入力してください")
      end

      it "番地が必須であること" do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addressを入力してください")
      end

      it "電話番号が必須であること" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone numberを入力してください")
      end

      it "電話番号にハイフンが入っていると登録できない" do
        @order_address.phone_number = "090-1111-2222"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone numberは不正な値です")
      end

      it "電話番号が10桁か11桁でないと登録できない" do
        @order_address.phone_number = "090111122222"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone numberは不正な値です")
      end

      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tokenを入力してください")
      end

      it "user_idが無い場合は登録できないこと" do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end

      it "tweet_idが無い場合は登録できないこと" do
        @order_address.tweet_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tweetを入力してください")
      end
      
    end
  end
end
