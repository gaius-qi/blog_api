class RemoveSummaryToPages < ActiveRecord::Migration[5.0]
  def change
    remove_column :pages, :summary, :string
  end
end
