class CreateArticlePlatforms < ActiveRecord::Migration
  def change
    create_table :article_platforms do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
