require 'rails_helper'

describe PhotoAlbum do
  it {should validate_presence_of(:name)}
end