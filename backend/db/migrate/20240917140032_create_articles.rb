class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :tag_list

      t.timestamps
    end
  end
end
