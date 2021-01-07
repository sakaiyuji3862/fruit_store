class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :tweet_id, null: false, foreign_key: true
      t.text :text,       null: false
      t.timestamps
    end
  end
end
