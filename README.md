# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ |-------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name               | string  | null: false               |
| age                | integer | null: false               |

### Association

- has_many :alarms
- has_many :memos


## alarms テーブル

| Column | Type        | Options                        |
| ------ |------------ | ------------------------------ |
| task   | string      | null: false                    |
| user   | references  | null: false, foreign_key: true |

### Association

- belongs_to :user


## memos テーブル

| Column  | Type        | Options                        |
| ------- |------------ | ------------------------------ |
| good    | string      |                                |
| black   | string      |                                |
| user    | references  | null: false, foreign_key: true |

### Association

- belongs_to :user


## messages テーブル

| Column     | Type        | Options |
| ---------- |------------ | ------- |
| content    | string      |         |