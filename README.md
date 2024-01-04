# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# システム名

## 概要
このシステムは、ユーザーが商品を出品・購入するためのプラットフォームです。

## データベース

### テーブル一覧

1. ユーザーテーブル (users)
2. 商品テーブル (items)
3. 購入履歴テーブル (purchases)

### テーブル詳細

#### 1. ユーザーテーブル (users)

| Column      | Type   | Options     | 説明                 |
|------------|-----------|----------|---------------------|
|name| string   | null: false | ユーザー名              |
|email| string   | null: false, unique: true | 
|encrypted_password| string   | null: false | パスワード   |
|surname_name| string | null: false  | お名前(全角)         |
|name_name| string  |null: false  | お名前(全角)         |
|surname_kana_name|  string | null: false  |  お名前カナ(全角)     |
|kana_name|  string | null: false  |  お名前カナ(全角)     |
|birthday| date     | null: false | 生年月日             |

### Association
- has_many :purchases
- has_many :items

### 2. 商品テーブル (items)

| Column      | Type   | Options     | 説明                |
|---------------|-----------|----------|--------------------|
|name| string   | null: false | 商品名              |
|description| text | null: false | 商品の説明           |
|price| integer   | null: false | 商品の価格           |
|user| references   | null: false, foreign_key: true | 
|category_id| integer   | null: false | 商品が所属するカテゴリ |
|condition_id| integer    | null: false | 商品の状態     |
|availability_id| integer   | null: false | 送料          |
|expected_shipping_date_id| integer  | null: false | 発送日の目安         |
|prefecture_id| integer |null: false | 都道府県 |

### Association
- has_one :purchase
- belongs_to :user


## 3. 購入履歴テーブル (purchases)

|_Column_| Type   | Options     | 説明                  |
|----------------|-----------|----------|----------------------|
|user| references   | null: false, foreign_key: true | 購入者のユーザーID      |
|item| references   | foreign_key: true null: false | 購入した商品のID        |


### Association
- has_one :recipient
- belongs_to :user
## 4. 宛先テーブル（recipients）

| Column      | Type   | Options     | 説明                  |
|----------------|-----------|----------|----------------------|
|post_code| string |null: false | 郵便番号 |
|prefecture_id| integer |null: false | 都道府県 |
|municipalities| string |null: false | 市区町村 |
|street_address| string | null: false | 番地 |
|telephone_number| string | null: false | 電話番号 |
|building_name| string | null: false | 建物名 |
|purchase| references | null: false foreign_key: true| 購入管理テーブルの外部キー |

### Association
belongs_to :purchase