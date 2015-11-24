require 'rails_helper'

describe Blog do
  it {should(validate_presence_of(:headline))}
  it {should(validate_presence_of(:body))}
  it {should have_many(:blog_files)}
  it {should have_many(:blog_comments)}
end
