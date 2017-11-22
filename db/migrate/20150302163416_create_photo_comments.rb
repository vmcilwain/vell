class CreatePhotoComments < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_comments do |t|
      t.belongs_to :photo
      t.string :name, :headline
      t.text :body
      t.timestamps
    end
  end
end
