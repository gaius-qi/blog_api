class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.text :body_html
      t.integer :editor_ids, default: [], null: false, array: true
      t.integer :comments_count, default: 0, null: false
      t.integer :changes_count, default: 1, null: false
      t.integer :word_count, default: 0, null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
