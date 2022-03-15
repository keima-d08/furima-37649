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
|                        |                   |                                       |
|                        |                   |                                       |

### Association
- has_many :items
- has_many :buyers

* itemsテーブル

| Colum                  | Type              | Options                               |
|------------------------|-------------------|---------------------------------------|
| name                   | string            |  null: false                          |
| content                | text              |  null: false                          |
| category               | integer           |  null: false                          |
| status                 | integer           |  null: false                          |
| postage                | integer           |  null: false                          |
| shipper                | integer           |  null: false                          |
| days_to_ship           | integer           |  null: false                          |
| price                  | integer           |  null: false                          |
| user                   | references        |  null: false, foreign_key: true       |
|                        |                   |                                       |

### Association
- belongs_to : user
- has_one :buyer
- has_one :destination

* buyersテーブル

| Colum                  | Type              | Options                               |
|------------------------|-------------------|---------------------------------------|
| item                   | references        |  null: false, foreign_key: true       |
| user                   | references        |  null: false, foreign_key: true       |
|                        |                   |                                       |
|                        |                   |                                       |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer

* destinationsテーブル

| Colum                  | Type              | Options                               |
|------------------------|-------------------|---------------------------------------|
| postcode               | integer           |  null: false                          |
| prefectures            | string            |  null: false                          |
| municipalities         | string            |  null: false                          |
| address                | integer           |  null: false                          |
| building_name          | string            |                                       |
| phone number           | integer           |  null: false                          |
| item                   | references        |  null: false, foreign_key: true       |
| buyer                  | references        |  null: false, foreign_key: true       |
|                        |                   |                                       |
|                        |                   |                                       |

- belongs_to :buyer
- belongs_to :item