class AddAttachmentDocumentToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :photos, :document
  end
end
