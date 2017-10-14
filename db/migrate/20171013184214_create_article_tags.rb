class CreateArticleTags < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|
      t.references :article, index: true, foreign_key: true
      t.string :tag

      t.timestamps null: false
    end
  end
end
