class CreateBlogComments < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_comments do |t|
      t.integer :blog_id
      t.string :name
      t.text :body
      t.timestamps
    end
  end
end
