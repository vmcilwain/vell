class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :photo_album
      t.string :description
      t.integer :created_by, :updated_by
      t.timestamps
    end
  end
end
