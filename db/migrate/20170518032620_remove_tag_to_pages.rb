class RemoveTagToPages < ActiveRecord::Migration[5.0]
  def change
    remove_column :pages, :tag, :string
  end
end
