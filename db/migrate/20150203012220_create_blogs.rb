class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.belongs_to :blog_category
      t.string :headline
      t.text :body
      t.timestamps
    end
  end
end
