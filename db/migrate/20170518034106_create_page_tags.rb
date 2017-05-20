class CreatePageTags < ActiveRecord::Migration[5.0]
  def change
    create_table :page_tags do |t|
      t.integer :page_id
      t.integer :tag_id
      t.string :content

      t.timestamps
    end
  end
end
