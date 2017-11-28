# Use with Pundit Matches: https://github.com/chrisalley/pundit-matchers
require 'rails_helper'
describe BlogCommentPolicy do
  subject { BlogCommentPolicy.new(user, blog_comment) }

  let(:blog_comment) { Fabricate :blog_comment }

  context 'for a visitor' do
    it {is_expected.to forbid_action(:index)}
    it {is_expected.to permit_action(:new)}
    it {is_expected.to permit_action(:create)}
    it {is_expected.to permit_action(:show)}
    it {is_expected.to forbid_action(:edit)}
    it {is_expected.to forbid_action(:update)}
    it {is_expected.to forbid_action(:destroy)}
  end

  context "for an admin" do

    let(:user) { Fabricate :user, admin: true }

    it {is_expected.to permit_action(:new)}
    it {is_expected.to permit_action(:create)}
    it {is_expected.to permit_action(:show)}
    it {is_expected.to permit_action(:edit)}
    it {is_expected.to permit_action(:update)}
    it {is_expected.to permit_action(:destroy)}
  end
end
