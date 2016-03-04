class AddMarkToComments < ActiveRecord::Migration
  def change
    add_column :comments, :mark, :integer
  end
end
