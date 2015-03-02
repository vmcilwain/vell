require 'rails_helper'

describe BlogFile do
  after {delete_files}
  it {should belong_to(:blog)}
  it {should validate_presence_of(:doc)}
end
