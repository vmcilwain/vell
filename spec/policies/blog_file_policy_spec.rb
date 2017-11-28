# Use with Pundit Matches: https://github.com/chrisalley/pundit-matchers
require 'rails_helper'
describe BlogFilePolicy do
  subject { BlogFilePolicy.new(user, blog_file) }
  let(:blog_file) { Fabricate :blog_file }
  after { delete_files }

  context 'for a visitor' do
    it {is_expected.to forbid_action(:new)}
    it {is_expected.to forbid_action(:create)}
    it {is_expected.to forbid_action(:edit)}
    it {is_expected.to forbid_action(:update)}
    it {is_expected.to forbid_action(:destroy)}
    it {is_expected.to permit_action(:download)}
  end

  context "for an admin" do

    let(:user) { Fabricate :user, admin: true }

    it {is_expected.to permit_action(:new)}
    it {is_expected.to permit_action(:create)}
    it {is_expected.to permit_action(:edit)}
    it {is_expected.to permit_action(:update)}
    it {is_expected.to permit_action(:destroy)}
    it {is_expected.to permit_action(:download)}
  end
end
