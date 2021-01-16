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