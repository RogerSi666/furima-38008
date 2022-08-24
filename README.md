# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| email              | string | null: false, unique: true |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string   null: false               |
| birthday           | date   | null: false               |
### Association

- has_many :items
- has_many :orders
- has_one  :adress

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ------     | -------------------------------|
| title            | string     | null: false                    |
| category         | string     | null: false                    |
| price            | integer    | null: false                    |
| post_price       | integer    | null: false                    |
| info             | text       | null: false                    |
| image            | text       | null: false                    |
| quality          | string     | null: false                    |
| from             | string     | null: false                    |
| when             | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one    :order

## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

- belongs_to :users
- belongs_to :item

## adresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| kana_last_name     | string     | null: false                    |
| kana_first_name    | string     | null: false                    |
| zip                | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| adress1            | string     | null: false                    |
| adress2            | string     |                                |
| telephone          | integer    | uniquie: true                  |
| user               | references | null: false, foreign_key: true |

- belongs_to :users