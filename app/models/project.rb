class Project < ActiveRecord::Base
  validates :repo_url, :description, presence: true
end
