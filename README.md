# README

* usersテーブル

| Colum                  | Type              | Options                               |
|------------------------|-------------------|---------------------------------------|
| email                  | string            |  null: false, unique: true            |
| encrypted_password     | string            |  null: false                          |
| nickname               | string            |  null: false                          |
| first_name             | string            |  null: false                          |
| last_name              | string            |  null: false                          |
| first_name_kana        | string            |  null: false                          |
| last_name_kana         | string            |  null: false                          |
| birthday               | date              |  null: false                          |


### Association
- has_many :items
- has_many :buyers

* itemsテーブル

| Colum                  | Type              | Options                               |
|------------------------|-------------------|---------------------------------------|
| name                   | string            |  null: false                          |
| content                | text              |  null: false                          |
| category_id            | integer           |  null: false                          |
| status_id              | integer           |  null: false                          |
| postage_id             | integer           |  null: false                          |
| prefecture_id          | integer           |  null: false                          |
| days_to_ship_id        | integer           |  null: false                          |
| price                  | integer           |  null: false                          |
| user                   | references        |  null: false, foreign_key: true       |


### Association
- belongs_to :user
- has_one :buyer

* buyersテーブル

| Colum                  | Type              | Options                               |
|------------------------|-------------------|---------------------------------------|
| item                   | references        |  null: false, foreign_key: true       |
| user                   | references        |  null: false, foreign_key: true       |


### Association
- belongs_to :user
- belongs_to :item
- has_one :destination

* destinationsテーブル

| Colum                  | Type              | Options                               |
|------------------------|-------------------|---------------------------------------|
| postcode               | string            |  null: false                          |
| prefecture_id          | integer           |  null: false                          |
| municipalities         | string            |  null: false                          |
| address                | integer           |  null: false                          |
| building_name          | string            |                                       |
| phone_number           | string            |  null: false                          |
| buyer                  | references        |  null: false, foreign_key: true       |


- belongs_to :buyer