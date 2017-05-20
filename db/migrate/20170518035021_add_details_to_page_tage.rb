class AddDetailsToPageTage < ActiveRecord::Migration[5.0]
  def change
    add_column :page_tags, :page_id, :integer, null: false
    add_column :page_tags, :tag_id, :integer, null: false
  end
end
