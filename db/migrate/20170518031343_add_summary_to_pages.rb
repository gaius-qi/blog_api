class AddSummaryToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :summary, :text
  end
end
