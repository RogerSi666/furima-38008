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

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ------     | -------------------------------|
| title            | string     | null: false                    |
| category_id      | integer    | null: false                    |
| price            | integer    | null: false                    |
| post_price_id    | integer    | null: false                    |
| information      | text       | null: false                    |
| quality_id       | integer    | null: false                    |
| from_id          | integer    | null: false                    |
| when             | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |
| adress     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :adress

## adresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| zip                | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| adress1            | string     | null: false                    |
| adress2            | string     |                                |
| telephone          | string     |                                |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order