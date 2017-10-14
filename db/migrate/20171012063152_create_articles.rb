class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :link_url
      t.string :image_url
      t.string :title
      t.string :sysnopsis
      t.references :article_category, index: true, foreign_key: true
      t.references :article_platform, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
