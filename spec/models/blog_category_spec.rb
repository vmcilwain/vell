require 'rails_helper'

describe BlogCategory do
  it {should validate_presence_of(:name)}
  it 'sets enabled to true' do
    blog_category = BlogCategory.create(name: Faker::Lorem.words(1).first)
    expect(blog_category.enabled).to eq true
  end
end
