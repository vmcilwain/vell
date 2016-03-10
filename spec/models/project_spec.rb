require 'rails_helper'

describe Project do
  it {should validate_presence_of :repo_url}
  it {should validate_presence_of :description}
end
