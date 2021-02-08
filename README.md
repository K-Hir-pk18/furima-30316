# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## Users

|Column             |Type     |Options                    |
|-------------------|---------|---------------------------|
| nickname          | string  | null: false, unique: true |
| mail_address      | string  | null: false, unique: true |
| password          | string  | null: false               |
| familyname_kanji  | string  | null: false               |
| firstname_kanji   | string  | null: false               |
| familyname_kana   | string  | null: false               |
| firstname_kana    | string  | null: false               |
| birth_year        | integer | null: false               |
| birth_month       | integer | null: false               |
| birth_date        | integer | null: false               |

### Association
- has_many :Products
- has_many :Purchases


## Products

|Column          |Type       |Options            |
|----------------|-----------|-------------------|
| product_name   | string    | null: false       |
| feature        | text      | null: false       |
| price          | integer   | null: false       |
| category       | integer   | null: false       |
| condition      | integer   | null: false       |
| send_charge    | integer   | null: false       |
| send_place     | integer   | null: false       |
| send_span      | integer   | null: false       |
| user           | reference | foreign_key: true |

### Association
-belongs_to :Users
-has_one_attached :Images
-has_one_attached :Purchases


## Images
不要？
|Column      |Type       |Options            |
|------------|-----------|-------------------|
| image      | image     | null: false       |
| product    | reference | foreign_key: true |

### Association
-belongs_to :Products


## Purchases

|Column          |Type       |Options            |
|----------------|-----------|-------------------|
| postal_code    | string    | null: false       |
| prefecture     | integer   | null: false       |
| municipality   | string    | null: false       |
| banch          | string    | null: false       |
| building_name  | string    |                   |
| telephone      | intger    | foreign_key: true |
| product        | reference | foreign_key: true |
| user           | reference | foreign_key: true |

### Association
-belongs_to :Users
-belongs_to :Products

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
