require 'rails_helper'

describe Photo do
  after{delete_files}
  it {should belong_to(:photo_album)}
  it {should validate_presence_of(:photo_album_id)}
  it {should validate_presence_of(:document)}
end