class RemoveNameToTags < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :name, :string
  end
end
