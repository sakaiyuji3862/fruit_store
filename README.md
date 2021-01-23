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

| アプリケーション名     | 規格外の果物やさん                          |
| ------------------- | ---------------------------------------- |
| アプリケーションの概要  | ・ログイン、ログアウト機能                   |
|                     | ・商品出品機能                             |
|                     | ・商品一覧表示機能                          |
|                     | ・商品詳細機能                             |
|                     | ・商品編集機能                             |
|                     | ・商品削除機能                             |
|                     | ・商品購入機能                             |
| ------------------- | ---------------------------------------- |
| URL                 | http://52.199.54.31/                     |
| ------------------- | ---------------------------------------- |
| テスト用アカウント     | 出品者用                                  |
|                     | メールアドレス test2@com                   |
|                     | パスワード aaa111                         |
|                     | 購入者用                                  |
|                     | メールアドレス test@com                    |
|                     | パスワード aaa111                         |
|                     | 購入者用カード情報                          |
|                     | 番号: 4242424242424242                   |
|                     | 期限: 4/25                               |
|                     | セキュリティコード: 123                    |

