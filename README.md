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

# テーブル設計

## users テーブル

| Column              | Type   | Options           |
| ------------------- | ------ | ----------------- |
| first_name_kanji    | string | null: false       | 
| last_name_kanji     | string | null: false       |
| first_name_katakana | string | null: false       | 
| last_name_katakana  | string | null: false       |
| nicknmame           | string | null: false       |
| email               | string | null: false       |
| password            | string | null: false       |
| birthday            | date   | null: false       |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column            | Type      | Options                                    |
| ----------------- | --------- | ------------------------------------------ |
| name              | string    | null: false                                |
| price             | integer   | null: false                                |
| picture           | text      | null: false                                |
| text              | text      | null: false                                |
| status_id         | integer   | null: false                                |
| delivery_fee_id   | integer   | null: false                                |
| category_id       | integer   | null: false                                |
| origin_area_id    | integer   | null: false                                |
| shopping_datum_id | integer   | null: false                                |
| user              | reference | null: false null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |                         
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shopping_address

## shopping_address テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| post_code         | string      | null: false                    | 
| prefecture_id     | integer     | null: false                    |
| city              | string      | null: false                    |
| address           | string      | null: false                    |
| building_number   | string      |                                |
| phone_number      | string      | null: false                    |
| purchase          | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase
