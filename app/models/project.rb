class Project < ActiveRecord::Base
  validates :repo_url, :live_url, :description, presence: true
end
