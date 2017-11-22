class CreatePhotoAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_albums do |t|
      t.string :name, :description
      t.timestamps
    end
  end
end
