# オリジナルアプリケーション  
<br />

## 規格外の果物屋さん
![599951E7-64F1-4D82-8C84-C7BD4A9FAF6B_1_102_o](https://user-images.githubusercontent.com/74819892/108184284-5b6a1a00-714e-11eb-9718-b85c7cd0b8cb.jpeg)
### URL
https://www.fruit-store-0526.com/
## アプリケーションの概要と開発した背景
生産者と消費者をつなぐマッチングサービスです。
社会問題である食品ロス解決のために開発しました。

今回は食品ロスの中でも農家における規格外商品のロスにスポットを当てました。
大きさや形が規格に合わないだけで市場に出せない果物や野菜を生産者から直接仕入れる仕組みになっています。
まだ食べられるものを捨てるのは『もったいない』と感じた私の実体験をもとに作成を致しました。

<br />
<br />

## 使用技術など
【フロントエンド】
<br />
・HTML/CSS  
・Bootstrap  
・JavaScript  
<br />
【バックエンド】
<br />
・Ruby '2.6.5'  
・Ruby on Rails '6.0.0'  
<br />
【データベース】
<br />
・MySQL  
<br />
【インフラ】
<br />
・AWS(S3、EC2、Route 53、ACM)  
・Nginx、Unicorn、MariaDB  
・Capistrano  
<br />
【テストコード】
<br />
・Rspec  
・FactoryBot  
・Faker  
・capybara  
<br />
【その他、使用したGem】
<br />
・devise  
・mini_magick  
・image_processing', '~> 1.2'  
・pry-rails  
・active_hash  
・kaminari  
・payjp (外部API)  
・rails-i18n  
・rubocop  
・aws-sdk-s3  

<br />
<br />

## 実装機能一覧
【ユーザー管理機能】
<br />
・deviseでの新規登録、ログイン機能  
・ログアウト機能  
・かんたんログイン機能  
<br />
【出品機能】
<br />
・商品の名前、説明文、画像、発送についての情報や値段設定を記入することにより出品  
・選択項目 ActiveHash  
・値段設定 JavaScript  
<br />
【一覧表示機能】
<br />
・出品した商品を全て閲覧  
<br />
【詳細表示機能】
<br />
・商品出品した際に記入した全ての情報の閲覧(出品画像をクリックすることで遷移)  
・出品者は商品の編集と削除ができ、出品者以外のユーザーは購入に遷移可能  
<br />
【削除機能、編集機能】
<br />
・商品詳細画面において、ユーザーが出品した商品のみを削除、編集可能  
<br />
【購入機能】
<br />
・商品を購入、クレジット情報と住所の記入が必須(商品詳細画面から遷移)  
・クレジットカード決済は、Pay.jpの外部APIを使用  
<br />
【コメント機能】
<br />
・商品詳細ページに制限なくコメントを投稿。また、削除可能  
<br />
【検索機能】
<br />
・商品名で検索可能  
<br />
【ページネーション機能】
<br />
・ページネーション gem 'kaminari'、Bootstrap  
<br />
【売却済み表示】
<br />
・売却した商品は"売却済"が表示  
<br />
【エラーメッセージ日本語化】
<br />
・gem 'rails-i18n'  

<br />
<br />

## 今後追加実装していきたい点、改善点
・レスポンシブデザインで正しい調整  
・コメント機能の非同期通信化  
・いいね機能  
・Dockerを使ったコンテナ化  
・CircleCIを導入してCI／CDパイプラインを構築  
・Rspecでのテストコードをしっかり作る  
・マイページ実装  

<br />
<br />

## テスト用アカウント
【出品者用】
<br />
・メールアドレス: test2@com  
・パスワード: aaa111  
<br />
【購入者用】
<br />
・メールアドレス: test@com  
・パスワード: aaa111  
<br />
【購入者用カード情報】
<br />
・番号: 4242424242424242  
・期限: 4/25
・セキュリティコード: 123  

<br />
<br />

## データベース設計(ER図)
![](https://i.gyazo.com/1e45964daafc92bdbed3f9642cda462f.png)

<br />
<br />
<br />

# テーブル設計

##  users(ユーザー管理)テーブル

| Column             | Type   | Options                      |
| ------------------ | ------ | ---------------------------- |
| nickname           | string | null: false                  |
| email              | string | null: false, uniqueness:true |
| encrypted_password | string | null: false                  | 

### Association

- has_many :orders
- has_many :tweets
- has_many :comments


## tweets(商品出品) テーブル

| Column           | Type    | Options                        |
| ---------------- | --------| ------------------------------ |
| name             | string  | null: false                    |
| price            | integer | null: false                    |
| text             | text    | null: false                    |
| shipping_cost_id | integer | null: false                    |
| shipping_day_id  | integer | null: false                    |
| prefecture_id    | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :comments


### Comments(コメント) テーブル

| Column   | Type    | Options                        |
| -------- | --------| ------------------------------ |
| user_id  | integer | null: false, foreign_key: true |
| tweet_id | integer | null: false, foreign_key: true |
| text     | text    | null: false                    |

### Association

- belongs_to :user
- belongs_to :tweet


##  address(住所) テーブル

| Column           | Type    | Options                         |
| ---------------- | ------- | ------------------------------- |
| post_code        | string  | null: false                     |
| prefecture_id    | integer | null: false                     |
| city             | string  | null: false                     |
| address          | string  | null: false                     |
| building_name    | string  |                                 |
| phone_number     | string  | null: false                     |
| order_id         | integer | null: false, foreign_key: true  |


### Association

- belongs_to :order


##  orders(商品購入) テーブル(中間テーブル)

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| user_id          | integer | null: false, foreign_key: true | 
| tweet_id         | integer | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :tweet

















