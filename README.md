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

| 列名       | データ型   | 制約     | 説明                 |
|------------|-----------|----------|---------------------|
| id         | INTEGER   | PRIMARY KEY | ユーザーID           |
| name       | VARCHAR   | NOT NULL | ユーザー名              |
| email      | VARCHAR   | NOT NULL | ユーザーのメールアドレス  |
| encrypted_password   | VARCHAR   | NOT NULL | パスワード   |
| created_at    | TIMESTAMP | NOT NULL | 出品日時             |
| updated_at    | TIMESTAMP | NOT NULL | 更新日時             |
|address        | STRING    | NOT NULL | 住所                |
|phone_number   | STRING    | NOT NULL | 電話番号             |
|created_at     | DateTime  | NOT NULL | 登録日時             |
| updated_at    | DateTime  | NOT NULL | 更新日時             |
|full_name      | NVARCHAR  |NOT NULL  | お名前(全角)         |
|kana_name      |  NVARCHAR |NOT NULL  |  お名前カナ(全角)     |
| created_at    | TIMESTAMP | NOT NULL | 作成日時             |
| updated_at    | TIMESTAMP | NOT NULL | 更新日時              
| birthday      | DATE      | NOT NULL | 生年月日             |

### 2. 商品テーブル (items)

| 列名          | データ型   | 制約     | 説明                |
|---------------|-----------|----------|--------------------|
| id            | INTEGER   | PRIMARY KEY | 商品ID           |
| name          | VARCHAR   | NOT NULL | 商品名              |
| description   | TEXT      | NOT NULL | 商品の説明           |
| price         | INTEGER   | NOT NULL | 商品の価格           |
| seller_id     | INTEGER   | NOT NULL | 出品者のユーザーID    |
| category_id   | INTEGER   | NOT NULL | 商品が所属するカテゴリ |
| condition     | STRING    | NOT NULL | 商品の状態           |
| availability  | INTEGER   | NOT NULL | 送料                |
| image_url     | STRING    | NOT NULL | 画像のURL           |
| name          | VARCHAR   | NOT NULL | 発送元の地域         |
| days          | INTEGER   | NOT NULL | 発送日の目安         |
| category_id   | INTEGER   | FOREIGN KEY| カテゴリー         |



## 3. 購入履歴テーブル (purchases)

| 列名           | データ型   | 制約     | 説明                  |
|----------------|-----------|----------|----------------------|
| id             | INTEGER   | PRIMARY KEY | 購入履歴ID          |
| buyer_id       | INTEGER   | NOT NULL | 購入者のユーザーID      |
| item_id        | INTEGER   | NOT NULL | 購入した商品のID        |
| purchase_date  | TIMESTAMP | NOT NULL | 購入日時               |
| amount         | INTEGER   | NOT NULL | 購入金額               |
| card_number    | VARCHAR(16)| NOT NULL | カード番号            |
| expiration_date| DATE      | NOT NULL | 有効期限               |
| security_code  | VARCHAR(4)| NOT NULL | セキュリティコード       |
| postal_code    | VARCHAR(7)| NOT NULL | 郵便番号               |
| created_at     | TIMESTAMP | NOT NULL | 作成日時               |
| updated_at     | TIMESTAMP | NOT NULL | 更新日時               |
| shipping_address| STRING   | NOT NULL | 配送先情報             |
|seller_id       | INTEGER   | NOT NULL | 商品を出品したユーザーのIDを表す|
|payment_method  | STRING    | NOT NULL | 支払方法               |
|status          | STRING    | NOT NULL | 購入の進行状況          |
|rating          | INTEGER   | NOT NULL | 取引の評価やレビュー情報 |
|review          | STRING    | NOT NULL | 評価コメントやレビュー   |