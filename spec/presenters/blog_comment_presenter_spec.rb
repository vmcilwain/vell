
require 'rails_helper'
#
describe BlogCommentPresenter do
  include_behavior

  let(:presenter) {BlogCommentPresenter.new(blog_comment, view)}
  let(:blog_comment) {Fabricate :blog_comment}

  it 'returns medium created_at date' do
    expect(presenter.medium_created_at).to eq blog_comment.created_at.strftime("%d %B %Y")
  end

  it 'returns medium updated_at date' do
    expect(presenter.medium_updated_at).to eq blog_comment.created_at.strftime("%d %B %Y")
  end

  it 'returns edit path' do
    expect(presenter.edit_link).to eq link_to :Edit, edit_blog_comment_path(blog_comment)
  end

  it "returns a muted parent blog link" do
    link_to blog_comment.blog.headline, blog_comment.blog, class: 'text-muted'
  end

  it "returns destroy path" do
    expect(presenter.delete_link).to eq link_to :Destroy, blog_comment_path(blog_comment), method: :delete, data: {confirm: 'Are you sure?'}
  end

  it "returns an unmuted parent blog link" do
    expect(presenter.headline_link).to eq link_to blog_comment.blog.headline, blog_comment.blog
  end

  it "returns edit path button" do
    expect(presenter.edit_button).to eq link_to :Edit, edit_blog_comment_path(blog_comment), class: 'btn btn-primary btn-xs'
  end
end
