class RemoveTypeFromPages < ActiveRecord::Migration[5.0]
  def change
    remove_column :pages, :type, :string
  end
end
