class AddMarkToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :mark, :integer
  end
end
