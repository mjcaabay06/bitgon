class RenameLinkUrlToArticleUrl < ActiveRecord::Migration
  def change
  	rename_column :articles, :link_url, :article_url
  end
end
