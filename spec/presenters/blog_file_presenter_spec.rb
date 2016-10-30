
require 'rails_helper'

describe BlogFilePresenter do
  include_behavior

  let(:presenter) {BlogFilePresenter.new(blog_file, view)}
  let(:blog_file) {Fabricate :blog_file}

  it 'returns image as a download link' do
    expect(presenter.image_download_path).to eq link_to image_tag(blog_file.doc.url, width: '150px'), download_blog_files_path(id: blog_file.id)
  end

  it 'returns edit path' do
    expect(presenter.edit_link).to eq link_to :Edit, edit_blog_file_path(blog_file)
  end

  it "returns download path" do
    expect(presenter.download_path).to eq link_to blog_file.doc_file_name, download_blog_files_path(id: blog_file.id)
  end

  it "returns destroy path" do
    expect(presenter.delete_link).to eq link_to :Delete, blog_file, method: :delete, data: {confirm: 'Are you sure?'}
  end
end
