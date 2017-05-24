class AddContentHtmlToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :content_html, :text
  end
end
