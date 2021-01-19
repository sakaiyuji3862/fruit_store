require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe '商品出品機能' do
    context '商品出品登録がうまくいくとき' do
      it "記入欄の全てが存在すれば登録できること" do
        expect(@tweet).to be_valid
      end
    end


    context '商品出品登録がうまくいかないとき' do
      it '商品画像が必須であること' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Imageを入力してください")
      end

      it '商品名が必須であること' do
        @tweet.name = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Nameを入力してください")
      end

      it '商品説明が必須であること' do
        @tweet.text = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Textを入力してください")
      end

      it '配送料の負担が1（---）の場合出品できない' do
        @tweet.shipping_cost_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Shipping costは1以外の値にしてください")
      end

      it '配送元の地域が1（---）の場合出品できない' do
        @tweet.prefecture_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Prefectureは1以外の値にしてください")
      end

      it '発想までの日数が1（---）の場合出品できない' do
        @tweet.shipping_day_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Shipping dayは1以外の値にしてください")
      end

      it '販売金額が必須であること' do
        @tweet.price = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Priceを入力してください")
      end

      it '販売金額が３００円以下だと登録できないこと' do
        @tweet.price = 299
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Priceは300以上の値にしてください")
      end

      it '販売金額が9999999円以上だと登録できないこと' do
        @tweet.price = 10000000
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Priceは9999999以下の値にしてください")
      end

    end
  end
end
