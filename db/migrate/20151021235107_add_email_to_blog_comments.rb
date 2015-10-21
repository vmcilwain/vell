class AddEmailToBlogComments < ActiveRecord::Migration
  def change
    add_column :blog_comments, :email, :string
  end
end
