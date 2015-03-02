require 'rails_helper'

describe PhotoAlbum do
  it {should validate_presence_of(:name)}
  it {should have_many(:photos)}
end