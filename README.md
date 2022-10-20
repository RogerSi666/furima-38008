# README

## アプリ名
フリマアプリ

## アプリケーションの概要
ユーザーを登録すると商品を出品できるようになります。自身が出品した商品は、編集と削除をすることができます。他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。

## URL

Herokuによるデプロイ

https://furima-38008.herokuapp.com/

### Basic認証

ID: admin
Pass: 2222

## テスト用アカウント等
### 購入者用

メールアドレス: test2@test.com
パスワード: testtest12

### 購入用カード情報

番号：4242424242424242
期限：今日より未来の日付
セキュリティコード：123

### 出品者用

メールアドレス名: test1@test.com
パスワード: testtest12

## Githubリポジトリ
https://github.com/RogerSi666/furima-38008

## 実装機能

1.ユーザー登録機能
ユーザー登録することで出品・購入できるようになります。（ユーザー登録していない人でも出品している商品を見ることは可能です。）マイページで特定のユーザーがつぶやいた商品一覧を取得する。

2.商品出品機能
商品画像を選択し、商品情報や販売したい金額を入力すると、出品することができます。（JavaScriptで販売手数料が表示されるようになっています。）画像をプレビューで確認できます。

3.商品の編集機能
出品した商品について、編集することができます。その際に、ユーザーの手間を省くため出品時の情報が表示されるようになっています。

4.商品の削除機能
出品中であった商品について、削除ボタンを押すことで商品を削除することができます。

5.商品の購入機能
出品者以外であれば、商品を購入することができます。カード情報と配送先を入力すると購入できます。（JavaScriptとフォームオブジェクトを使用し、トークン化したカード情報をPAY.JPに送付しつつ、カード情報がアプリケーションのデータベースに保存されないように設計しています。）

6. コメント機能
商品詳細ページでコメントを投稿すると、リロードすることなくコメントが反映される。別のブラウザで同じ商品を開いていた場合も、リロードすることなくコメントが反映される"。

7. 検索機能

商品は数点出品されていることが前提。商品名・サイズ・商品状況などの検索案件を指定する欄を儲ける。
案件に相当する商品の検索結果のページで表示する。

8. エラーメッセージ日本語化

ユーザー登録や商品投稿画面の入力フォームが空だった場合などに表示されるエラーメッセージを日本語で表示する。

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
| prefecture_id    | integer    | null: false                    |
| shipment_day_id  | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| zip                | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address1            | string     | null: false                    |
| address2            | string     |                                |
| telephone          | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order

# clone

% git clone  https://github.com/RogerSi666/furima-38008.git
% cd furima-38008
% bundle install
% rails db:create
% rails db:migrate