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

![ER図(BOOK_SHARE)](./app/assets/images/book_share.png)