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
| first_name_hiragana | string | null: false       | 
| last_name_hiragana  | string | null: false       |
| nicknmame           | string | null: false       |
| email               | string | null: false       |
| password            | string | null: false       |
| birthday            | string | null: false       |

### Association

- has_many :items
- has_many :purchase
- has_one :credit card


## items テーブル

| Column           | Type      | Options                                    |
| ---------------- | --------- | ------------------------------------------ |
| name             | string    | null: false                                |
| price            | interger  | null: false                                |
| picture          | text      | null: false                                |
| text             | string    | null: false                                |
| status           | string    | null: false                                |
| delivery fee     | string    | null: false                                |
| category_id      | string    | null: false                                |
| origin_area_id   | interger  | null: false                                |
| shopping data_id | interger  | null: false                                |
| user             | reference | null: false null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase


## purchase テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |                         
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many :credit card
- has_one :shopping address

## shopping address テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| post code         | string      | null: false                    | 
| prefecture_id     | integer     | null: false                    |
| address           | string      | null: false                    |
| phone number      | string      | null: false                    |
| purchase          | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase
