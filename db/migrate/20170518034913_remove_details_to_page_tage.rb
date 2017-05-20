class RemoveDetailsToPageTage < ActiveRecord::Migration[5.0]
  def change
    remove_column :page_tags, :page_id, :integer
    remove_column :page_tags, :tag_id, :integer
  end
end
