class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :user_id, null: false
      t.string :type, null: false 
      t.timestamps null: false
    end
  end
end
