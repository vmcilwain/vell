# @author Lovell McIlwain
# Handles business logic for project
class Project < ApplicationRecord
  # Used with elasticsearch
  searchkick

  # ActiveRecord validations for presence
  validates :repo_url, :description, presence: true

  #ActiveRecord Callback
  # (see #reindex_project)
  after_save :reindex_project

  # Searchkick index fields
  def search_data
    {
      repo_url: repo_url,
      live_url: live_url,
      description: description
    }
  end

  private

  # Rebuild search index
  def reindex_project
    Project.reindex # or reindex_async
  end
end
