class AddCreatedToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :created, :datetime
  end
end
