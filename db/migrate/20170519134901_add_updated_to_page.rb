class AddUpdatedToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :updated, :datetime
  end
end
