# アプリケーション名
## Rest-timer

[![Image from Gyazo](https://i.gyazo.com/d76e597a7010cc9489fe4dd54bd76f81.gif)](https://gyazo.com/d76e597a7010cc9489fe4dd54bd76f81)

[![Image from Gyazo](https://i.gyazo.com/f6643be5d71b0af2080c399b394b9081.gif)](https://gyazo.com/f6643be5d71b0af2080c399b394b9081)

# 概要
 能動的な休憩時間を過ごしていただくための<br>アプリケーションです

# ご利用方法
 休憩の設定にて予め休憩中のタスクをいくつか設定しておきます<br>
 タイマー開始ページにてタスクを指定し、休憩を開始します<br>
 メモ欄はご自由にお使いいただけます

# URL
 https://rest-timer1.herokuapp.com/alarms

# テスト用アカウント
## メールアドレス
yamada@taro

## パスワード
yamada1

# 開発環境
Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code

# 工夫した点について
休憩のアラーム機能のみにならないよう、学習に関するメモや休憩タスクの管理といった<br>
自分で行うのは少し煩わしいが学習効率アップの機能を盛り込みました。

# 今後追加したい機能
音声認識機能を用いて、休憩までの時間を<br>より円滑にしたいと考えています。


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