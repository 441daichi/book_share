# アプリケーション名

BOOK SHARE

# アプリケーション概要

読み終わった本の感想を投稿し、ユーザー同士で共有することができる。

# URL

# テスト用アカウント

# 利用方法

1.トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う。
2.新規投稿ボタンから、本の詳細(画像・タイトル・作者名・ジャンル・５段階評価・レビューコメント)を入力し投稿する。
3.一覧ページ・検索結果ページから詳細ページに遷移し、ほかのユーザーの投稿にコメントをする。

# アプリケーションを作成した背景

学生の頃から小説を読むことが好きで、自分の感想を保存したり、他人の読んだ感想などを聞いたりしたかった。そのため、SNS上で感想を共有するアプリケーションがあれば、それを実現できると思い、開発することにした。

# 実装した機能についての画像やGIFおよびその説明

# 工夫したポイント

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

- has_many : reviews
- has_many : comments

## reviews テーブル

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| user               | references | null: false, foreign_key: true |
| title              | string     | null: false |
| author             | string     | null: false |
| genre              | integer    | null: false |
| tag                | string     |             |
| evaluation_id      | integer    | null: false |
| impression         | text       |             |

### Association

- belongs_to : user
- has_many : comment

# comments テーブル

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| user               | references | null: false, foreign_key: true |
| review             | references | null: false, foreign_key: true |
| comment_text       | text       | null: false |

### Association

- belongs_to : user
- belongs_to : review

## ER図

![ER図(BOOK_SHARE)](./app/assets/images/book_share.png)

## 画面遷移図

![画面遷移図(BOOK_SHARE)](./app/assets/images/flow.png)