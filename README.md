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
| name       | VARCHAR   | NOT NULL | ユーザー名              |
| email      | VARCHAR   | NOT NULL | ユーザーのメールアドレス  |
| encrypted_password   | VARCHAR   | NOT NULL | パスワード   |
|surname_name      | NVARCHAR  |NOT NULL  | お名前(全角)         |
|name_name      | NVARCHAR  |NOT NULL  | お名前(全角)         |
|surname_kana_name      |  NVARCHAR |NOT NULL  |  お名前カナ(全角)     |
|kana_name      |  NVARCHAR |NOT NULL  |  お名前カナ(全角)     |
| birthday      | DATE      | NOT NULL | 生年月日             |

### Association
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages

### 2. 商品テーブル (items)

| Column      | Type   | Options     | 説明                |
|---------------|-----------|----------|--------------------|
| name          | STRING   | NOT NULL | 商品名              |
| description   | TEXT      | NOT NULL | 商品の説明           |
| price         | INRGER   | NOT NULL | 商品の価格           |
| seller_id     | INTEGER   | NOT NULL | 出品者のユーザーID    |
| category_id   | INTEGER   | NOT NULL | 商品が所属するカテゴリ |
| condition_id     | INTEGER    | NOT NULL | 商品の状態           |
| availability_id | STRING   | NOT NULL | 送料                |
| days_id         | STRING   | NOT NULL | 発送日の目安         |
| category_id   | INTEGER   | FOREIGN KEY| カテゴリー         |

### Association
has_and_belongs_to_many :tags 


## 3. 購入履歴テーブル (purchases)

| Column      | Type   | Options     | 説明                  |
|----------------|-----------|----------|----------------------|
| buyer_id       | INTEGER   | NOT NULL | 購入者のユーザーID      |
| item_id        | INTEGER   | NOT NULL | 購入した商品のID        |
| purchase_date  | TIMESTAMP | NOT NULL | 購入日時               |
| amount         | INTEGER   | NOT NULL | 購入金額               |
| postal_code    | VARCHAR(7)| NOT NULL | 郵便番号               |
| created_at     | TIMESTAMP | NOT NULL | 作成日時               |
|seller_id       | INTEGER   | NOT NULL | 商品を出品したユーザーのIDを表す|

### Association
has_and_belongs_to_many
