class AddAuthorToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :author, :integer
  end
end
