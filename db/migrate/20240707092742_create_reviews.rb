class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :user,          null: false, foreign_key: true
      t.string     :title,         null: false
      t.string     :author,        null: false
      t.integer    :genre,         null: false
      t.string     :tag
      t.integer    :evaluation_id, null: false
      t.text       :impression
      t.timestamps
    end
  end
end
--------------------|------------|-------------|
| user               | references | null: false, foreign_key: true |
| title              | string     | null: false |
| author             | string     | null: false |
| genre              | integer    | null: false |
| tag                | string     |             |
| evaluation_id      | integer    | null: false |
| impression         | text       |             |
