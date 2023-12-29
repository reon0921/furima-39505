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
|_name_| string   | null: false | ユーザー名              |
|_email_| string   | null: false, unique: true | 
|_encrypted_password_| string   | null: false | パスワード   |
|_surname_name_| string | null: false  | お名前(全角)         |
|_name_name_| string  |null: false  | お名前(全角)         |
|_surname_kana_name_|  string | null: false  |  お名前カナ(全角)     |
|_kana_name_|  string | null: false  |  お名前カナ(全角)     |
|_birthday_| DATE      | null: false | 生年月日             |

### Association
-CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  ...
);
### 2. 商品テーブル (items)

| Column      | Type   | Options     | 説明                |
|---------------|-----------|----------|--------------------|
|_name_| STRING   | null: false | 商品名              |
|_description_| TEXT      | null: false | 商品の説明           |
|_price_| INRGER   | null: false | 商品の価格           |
|_user_| references   | null: false, foreign_key: true | 
|_category_id_| INTEGER   | null: false | 商品が所属するカテゴリ |
|_condition_id_| INTEGER    | null: false | 商品の状態     |
|_availability_id_| INTEGER   | null: false | 送料          |
|_Expected shipping date_id_| STRING   | null: false | 発送日の目安         |
 <option value="item3">商品</option>　foreign_key: true
### Association
class Item < ApplicationRecord
  has_and_belongs_to_many :carts
  ...
end

class Cart < ApplicationRecord
  has_and_belongs_to_many :items
  ...
end



## 3. 購入履歴テーブル (purchases)

|_Column_| Type   | Options     | 説明                  |
|----------------|-----------|----------|----------------------|
|_user_| INTEGER   | NOT NULL | 購入者のユーザーID      |
|_item_id_| INTEGER   | NOT NULL | 購入した商品のID        |
ALTER TABLE purchases ADD FOREIGN KEY (buyer_id) REFERENCES users(user_id);
CREATE TABLE customers (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  ...
);

### Association
has_and_belongs_to_many

## 4. 宛先テーブル（recipients）

| Column      | Type   | Options     | 説明                  |
|----------------|-----------|----------|----------------------|
|_prefectures_| string |null: false | 都道府県 |
|_municipalities_| string |null: false | 市区町村 |
|_street address_| string | null: false | 番地 |
|_telephone number_| string | null: false | 電話番号 |
| 
ALTER TABLE recipients customers ADD FOREIGN KEY  REFERENCES shipping_address_id: