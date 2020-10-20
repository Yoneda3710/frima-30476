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
- has_many :deals


## items テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| name          | string  | null: false                    |
| description   | text    | null: false                    |
| price         | integer | null: false                    |
| category_id   | integer | null: false                    |
| status_id     | integer | null: false                    |
| shipping_id   | integer | null: false                    |
| prefecture_id | integer | null: false                    |
| scheduled_id  | integer | null; false                    |
| user    | references    | null: false, foreign_key: true | 
### Association
- belongs_to :user
- has_one :deal

## address テーブル

| Column           | Type       | Options                          |
| ---------------- | ---------- | -------------------------------- |
| postal_code      | string     | null: false                      |
| prefectures_id   | integer    | null: false                      |
| municipality     | string     | null: false                      |
| address          | string     | null: false                      |
| building         | string     |                                  |
| phone_number     | string     | null: false                      |
| deal             | references | null: false, foreign_key: true   |
### Association
- belongs_to :deal


## deals テーブル

| Column        | Type    | Options                                |
| ------------- | ------- | -------------------------------------- |
| user             | references | null; false, foreign_key: true   |
| item             | references | null: false, foreign_key: true   |
### Association
- belongs_to :user
- belongs_to :item
- has_one :address