class AddEmailToBlogComments < ActiveRecord::Migration[5.1]
  def change
    add_column :blog_comments, :email, :string
  end
end
