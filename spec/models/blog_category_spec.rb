require 'rails_helper'

describe BlogCategory do
  it {should validate_presence_of(:name)}
end