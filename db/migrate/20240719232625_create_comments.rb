class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user,              null: false, foreign_key: true
      t.references :review,            null: false, foreign_key: true
      t.text :comment_text,            null: false
      t.timestamps
    end
  end
end
