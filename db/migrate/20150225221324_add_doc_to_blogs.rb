class AddDocToBlogs < ActiveRecord::Migration[5.1]
  def self.up
    add_attachment :blog_files, :doc
  end

  def self.down
    remove_attachment :blog_files, :doc
  end
end
