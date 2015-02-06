require 'rails_helper'

describe BlogFilesController do
  describe 'GET index' do
    it 'sets @blog_files' do
      blog_file
      expect(assigns[:blog_files]).to eq [blog_file]
    end
  end
  describe 'GET show'
  describe 'GET new'
  describe 'POST create'
  describe 'GET edit'
  describe 'PUT update'
end
