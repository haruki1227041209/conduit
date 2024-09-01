class CreateArticlePages < ActiveRecord::Migration[7.0]
  def change
    create_table :article_pages do |t|
      t.string :title
      t.string :description
      t.text :body
      t.text :tag_list

      t.timestamps
    end
  end
end
