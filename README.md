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
| buyer                  | references        |                                       |
|                        |                   |                                       |

### Association
- has_many :items
- has_one :buyer

* itemsテーブル

| Colum                  | Type              | Options                               |
|------------------------|-------------------|---------------------------------------|
| name                   | string            |  null: false                          |
| content                | text              |  null: false                          |
| category               | string            |  null: false                          |
| status                 | string            |  null: false                          |
| postage                | string            |  null: false                          |
| shipper                | string            |  null: false                          |
| days_to_ship           | string            |  null: false                          |
| price                  | integer           |  null: false                          |
| user                   | references        |  null: false, foreign_key: true       |
| buyer                  | references        |                                       |

### Association
- belongs_to : user
- has_one :buyer


* buyersテーブル

| Colum                  | Type              | Options                               |
|------------------------|-------------------|---------------------------------------|
| postcode               | integer           |  null: false                          |
| prefectures            | string            |  null: false                          |
| municipalities         | string            |  null: false                          |
| address                | integer           |  null: false                          |
| building_name          | string            |                                       |
| phone number           | integer           |  null: false                          |
| item                   | references        |  null: false, foreign_key: true       |
| user                   | references        |  null: false, foreign_key: true       |
|                        |                   |                                       |
|                        |                   |                                       |

### Association
- belongs_to :user
- belongs_to :item


