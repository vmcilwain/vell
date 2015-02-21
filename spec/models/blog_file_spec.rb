require 'rails_helper'

describe BlogFile do
  it {should belong_to(:blog)}
  it {should validate_presence_of(:blog_document)}
end
