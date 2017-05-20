class AddDetailsToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :summary, :string
    add_column :pages, :tag, :string, :array => true
  end
end
