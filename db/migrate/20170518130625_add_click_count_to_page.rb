class AddClickCountToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :click_count, :integer
  end
end
