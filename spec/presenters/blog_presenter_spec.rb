
require 'rails_helper'
#
describe BlogPresenter do
  include_behavior

  let(:presenter) {BlogPresenter.new(blog, view)}
  let(:blog) {Fabricate :blog}

  it 'returns blog headline as a link to the blog' do
    expect(presenter.headline_link).to eq link_to blog.headline, blog
  end

  it 'returns edit path' do
    expect(presenter.edit_link).to eq link_to :Edit, edit_blog_path(blog)
  end

  it 'returns destroy path' do
    expect(presenter.delete_link).to eq link_to :Delete, blog, method: :delete, data: {confirm: 'Are you sure?'}
  end

  it 'returns count of comments' do
    expect(presenter.comments_count).to eq pluralize(blog.blog_comments.count, 'Comment')
  end

  it 'returns count of files' do
    expect(presenter.files_count).to eq pluralize(blog.blog_files.count, 'File')
  end

  it 'returns blog body with executed html' do
    expect(presenter.raw_body).to eq raw blog.body
  end

  it 'returns short form of created date' do
    expect(presenter.short_created_at).to eq blog.created_at.strftime("%Y-%m-%d")
  end

  it 'returns trucated blog body' do
    expect(presenter.truncated_body).to eql truncate(blog.body.gsub(/<\/?[^>]+>/, ''), length: 50) {link_to ' Read More', blog}
  end

  it 'returns comments count as a link' do
    expect(presenter.comments_count_link).to eq link_to pluralize(blog.blog_comments.count, 'Comment'), blog
  end

  it 'returns files count as a link' do
    expect(presenter.files_count_link).to eq link_to pluralize(blog.blog_files.count, 'File'), blog
  end
end
