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

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| name_kanji    | string | null: false |
| name_katakana | string | null: false |
| name_hiragana | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| birthday      | string | null: false |

### Association

- has_many :items
- has_many :purchase
- has_one :credit card


## items テーブル

| Column          | Type      | Options                                   |
| --------------- | --------- | ----------------------------------------- |
| name            | string    | null: false                               |
| price           | interger  | null: false                               |
| picture         | text      | null: false                               |
| text            | string    | null: false                               |
| origin_area     | string    | null: false                               |
| shopping data   | string    | null: false                               |
| user            | reference | null: false null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many :purchase


## purchase テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |                         |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many :credit card
- has_one :shopping address

## shopping address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post code      | interger   | null: false                    | 
| prefecture     | string     | null: false                    |
| address        | string     | null: false                    |
| phone number   | interger   | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## credit card テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase