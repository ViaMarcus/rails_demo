class ChangeAuthorToBeUsernameInArticles < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :author, :string
  end
end
