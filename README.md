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
| id         | INTEGER   | PRIMARY KEY | ユーザーID              |
| name       | VARCHAR   | NOT NULL | ユーザー名               |
| email      | VARCHAR   | NOT NULL | ユーザーのメールアドレス  |
| password   | VARCHAR   | NOT NULL | パスワード              |
| created_at | TIMESTAMP | NOT NULL | 作成日時               |
| updated_at | TIMESTAMP | NOT NULL | 更新日時               |

#### 2. 商品テーブル (items)

| 列名          | データ型   | 制約     | 説明                |
|---------------|-----------|----------|--------------------|
| id            | INTEGER   | PRIMARY KEY | 商品ID             |
| name          | VARCHAR   | NOT NULL | 商品名              |
| description   | TEXT      | NOT NULL | 商品の説明           |
| price         | INTEGER   | NOT NULL | 商品の価格           |
| seller_id     | INTEGER   | NOT NULL | 出品者のユーザーID     |
| created_at    | TIMESTAMP | NOT NULL | 出品日時             |
| updated_at    | TIMESTAMP | NOT NULL | 更新日時             |

#### 3. 購入履歴テーブル (purchases)

| 列名           | データ型   | 制約     | 説明                  |
|----------------|-----------|----------|----------------------|
| id             | INTEGER   | PRIMARY KEY | 購入履歴ID             |
| buyer_id       | INTEGER   | NOT NULL | 購入者のユーザーID       |
| item_id        | INTEGER   | NOT NULL | 購入した商品のID        |
| purchase_date  | TIMESTAMP | NOT NULL | 購入日時               |
| amount         | INTEGER   | NOT NULL | 購入金額               |
| created_at     | TIMESTAMP | NOT NULL | 作成日時               |
| updated_at     | TIMESTAMP | NOT NULL | 更新日時               |
