class AddSlugToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :slug, :string, unique: true
    add_index :articles, :slug, unique: true
  end
end
