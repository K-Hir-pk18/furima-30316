# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## Users
|Column              |Type     |Options                    |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| familyname_kanji   | string  | null: false               |
| firstname_kanji    | string  | null: false               |
| familyname_kana    | string  | null: false               |
| firstname_kana     | string  | null: false               |
| birth_profile      | date    | null: false               |

### Association
- has_many :Products
- has_many :Purchase_logs


## Products
|Column          |Type       |Options            |
|----------------|-----------|-------------------|
| product_name   | string    | null: false       |
| feature        | text      | null: false       |
| price          | integer   | null: false       |
| category_id    | integer   | null: false       |
| condition_id   | integer   | null: false       |
| send_charge_id | integer   | null: false       |
| prefecture_id  | integer   | null: false       |
| send_span_id   | integer   | null: false       |
| user_id        | reference | foreign_key: true |

### Association
-belongs_to :User
-has_one :Purchase_log


## Purchase_logs
|Column          |Type       |Options            |
|----------------|-----------|-------------------|
| product        | reference | foreign_key: true |
| user           | reference | foreign_key: true |

### Association
-belongs_to :User
-belongs_to :Product


## Purchases
|Column          |Type       |Options            |
|----------------|-----------|-------------------|
| postal_code    | string    | null: false       |
| prefecture_id  | integer   | null: false       |
| municipality   | string    | null: false       |
| banch          | string    | null: false       |
| building_name  | string    |                   |
| telephone      | string    | null: false       |

### Association
-has_one :Purchase_log


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
