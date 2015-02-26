class CreateBlogFiles < ActiveRecord::Migration
  def change
    create_table :blog_files do |t|
      t.belongs_to :blog
      t.string :description
      t.integer :created_by, :updated_by
      t.timestamps
    end
  end
end
