require 'rails_helper'

describe BlogComment do
  it {should belong_to(:blog)}
  it {should validate_presence_of(:blog_id)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:body)}
end