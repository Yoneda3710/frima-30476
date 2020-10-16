# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| kana_family_name | string | null: false |
| kana_first_name  | string | null: false |
| birthday         | date   | null: false |
### Association
- has_many :items
- has_many :orders


## items テーブル

| Column      | Type    | Options          |
| ----------- | ------- | ---------------- |
| name        | text    | null: false      |
| description | text    | null: false      |
| price       | integer | null: false      |
| references  | user    | foreign_key: true|
### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| card_number  | integer    | null: false                    |
| expiration   | date       | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item

