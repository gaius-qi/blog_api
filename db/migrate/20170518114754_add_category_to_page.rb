class AddCategoryToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :category, :integer
  end
end
