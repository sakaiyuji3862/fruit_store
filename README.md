# 規格外の果物屋さん
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

### 実装機能
## 機能
ユーザー管理機能
## 詳細
・deviseでの新規登録、ログイン機能  
・ログアウト機能  
・かんたんログイン機能  
## 新規登録画面
![](https://i.gyazo.com/8c70372e6425893e66db7014632e4f82.jpg)
## ログイン画面
![](https://i.gyazo.com/3a764c24910eb988dc268084a584e993.jpg)

<br />
<br />
<br />

## 機能
出品機能
## 詳細
・商品の名前、説明文、画像、発送についての情報や値段設定を記入する
ことにより出品  
・選択項目 ActiveHash  
・値段設定 JavaScript  
## 出品画面への遷移
![](https://i.gyazo.com/f331b21ced636a6ca5608a14ced579d8.gif)
## 出品画面
![](https://i.gyazo.com/89fa7ff03464d2eaac7f57a0b71f37ae.gif)

<br />
<br />
<br />

## 機能
一覧表示機能
## 詳細
・出品した商品を全て閲覧
## 実装した機能についてのGIF
![](https://i.gyazo.com/26748f6bdd19a0bd6d14e01c5c945910.gif)

<br />
<br />
<br />

## 機能
詳細表示機能
## 詳細
・商品出品した際に記入した全ての情報の閲覧(出品画像をクリックすることで遷移)  
・出品者は商品の編集と削除ができ、出品者以外のユーザーは購入に遷移可能  
## 実装した機能についてのGIF
![](https://i.gyazo.com/c2488e07e117a84bd5bf9e7209d08602.gif)

<br />
<br />
<br />

## 機能
編集機能
## 詳細
・商品詳細画面において、ユーザーが出品した商品のみを編集できるように実装(商品詳細画面から遷移)
## 実装した機能についてのGIF
![](https://i.gyazo.com/86766578f24f99a2850f8bade0822cb6.gif)

<br />
<br />
<br />

## 機能
削除機能
## 詳細
・商品詳細画面において、ユーザーが出品した商品のみを削除可能
## 実装した機能についてのGIF
![](https://i.gyazo.com/7b48903fc7409fff23efe3f603a0c654.gif)

<br />
<br />
<br />

## 機能
購入機能
## 詳細
・商品を購入、クレジット情報と住所の記入が必須(商品詳細画面から遷移)  
・クレジットカード決済は、Pay.jpの外部APIを使用
## 実装した機能についてのGIF
![](https://i.gyazo.com/13f3e85722f41a5279a6a02c7dbed7b7.gif)

<br />
<br />
<br />

## 機能
コメント機能
## 詳細
・商品詳細ページに制限なくコメントを投稿。また、削除可能
## 実装した機能についてのGIF
![](https://i.gyazo.com/e5bec156732b650b5375147c0416da9f.gif)

<br />
<br />
<br />

## 機能
検索機能
## 詳細
・商品名で検索可能
## 実装した機能についてのGIF
![](https://i.gyazo.com/f94ca5f51749601d379e52c00fdf111e.gif)

<br />
<br />
<br />

## 機能
ページネーション機能
## 詳細
・ページネーション gem 'kaminari'、Bootstrap
## ストーリー(ユースケース)
## 実装した機能についてのGIF
![](https://i.gyazo.com/7d7edcf158caa472f9fe8c45afb93eef.png)
![](https://i.gyazo.com/1e53b296de8e3e8668b72fc8e3cdfedd.png)

<br />
<br />
<br />

## 機能
売却済み表示
## 詳細
・売却した商品は"売却済"が表示
## 実装した機能についてのGIF
![](https://i.gyazo.com/ad8e6e21deded65e8fc5d02d8d877c53.png)

<br />
<br />
<br />

## 機能
エラーメッセージ日本語化
## 詳細
・gem 'rails-i18n' 
## 実装した機能についてのGIF
![](https://i.gyazo.com/8fe040ee2fb6d22d38dbc4655811fd82.png)

<br />
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


# オリジナルアプリケーション

| アプリケーション名     | 規格外の果物やさん                                           |
| ------------------- | --------------------------------------------------------- |
| アプリケーションの概要  | ・ログイン、ログアウト機能                                    |
|                     | ・商品出品機能                                              |
|                     | ・商品一覧表示機能                                           |
|                     | ・商品詳細機能                                              |
|                     | ・商品編集機能                                              |
|                     | ・商品削除機能                                              |
|                     | ・商品購入機能                                              |
|                     |                                                           |
| URL                 | https://www.fruit-store-0526.com/                         |
|                     |                                                           |
| テスト用アカウント     | 出品者用                                                   |
|                     | メールアドレス test2@com                                    |
|                     | パスワード aaa111                                          |
|                     | 購入者用                                                   |
|                     | メールアドレス test@com                                     |
|                     | パスワード aaa111                                          |
|                     | 購入者用カード情報                                          |
|                     | 番号: 4242424242424242                                    |
|                     | 期限: 4/25                                                |
|                     | セキュリティコード: 123                                     |
|                     |                                                          |
| 利用方法             |                                                           |
|                     |                                                           |
| 目指した課題解決       | 社会問題にもなっている食品ロスについての解決。味は劣              |
|                     | らないのに大きさや形が規格に合わないだけで市場に出せない           |
|                     | 果物や野菜を直接生産者から仕入れられるアプリケーションを           |
|                     | 作り、今まで廃棄していた物の価値を見直す為。このアプリ             |
|                     | ケーションを使って頂くことで生産者と消費者を繋げたり『ま           |
|                     | だ食べられるものを捨てない』という当たり前のことを改めて           |
|                     | 意識してもらうキッカケを作りたいと思い作成。                     |
|                     |                                                          |

<br />
<br />

## 今後追加実装していきたい点、改善点
・レスポンシブデザインで正しい調整  
・コメント機能の非同期通信化  
・いいね機能  
・Dockerを使ったコンテナ化  
・CircleCIを導入してCI／CDパイプラインを構築  
・Rspecでのテストコードをしっかり作る  

# 最後に
オリジナルアプリケーションもまだまだ改善したいことが  
たくさんあり、これから新しい技術を追加してより使いやす  
くしていきたいと考えております。  
私自身も技術的には入り口に立ったばかりなので、これから  
たくさんの技術を勉強できることがとても楽しみです。  
ここまでご覧いただき、ありがとうございました。












