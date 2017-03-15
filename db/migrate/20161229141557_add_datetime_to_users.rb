class AddDatetimeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :datetime, :datetime
    add_column :users, :admin, :boolean, :default => false
  end
end
