class CreatePageVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :page_versions do |t|
      t.integer :user_id, null: false
      t.integer :page_id, null: false
      t.integer :version, default: 0, null: false
      t.string :title, null: false
      t.timestamps
    end
  end
end
