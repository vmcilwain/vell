require 'rails_helper'

describe Blog do
  it {should(validate_presence_of(:headline))}
  it {should(validate_presence_of(:blog_category_id))}
  it {should(validate_presence_of(:body))}
  it {should(belong_to(:blog_category))}
end