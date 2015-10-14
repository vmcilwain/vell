class AddToTwitterToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :to_twitter, :boolean, default: 0 
  end
end
