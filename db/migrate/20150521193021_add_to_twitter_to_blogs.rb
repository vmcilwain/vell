class AddToTwitterToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :to_twitter, :boolean, default: 0
  end
end
