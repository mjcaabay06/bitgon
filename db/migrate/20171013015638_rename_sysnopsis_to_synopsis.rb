class RenameSysnopsisToSynopsis < ActiveRecord::Migration
  def change
  	rename_column :articles, :sysnopsis, :synopsis
  end
end
