require 'rails_helper'

describe PhotoComment do
  it {should belong_to(:photo)}
  it {should validate_presence_of(:photo_id)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:headline)}
  it {should validate_presence_of(:body)}
end