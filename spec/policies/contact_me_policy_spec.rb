# Use with Pundit Matches: https://github.com/chrisalley/pundit-matchers
require 'rails_helper'
describe ContactMePolicy do
  subject { ContactMePolicy.new(user, contact_me) }
  let(:contact_me) { Fabricate :contact_me }

  context 'for a visitor' do\
    it {is_expected.to forbid_action(:index)}
    it {is_expected.to permit_action(:new)}
    it {is_expected.to permit_action(:create)}
    it {is_expected.to forbid_action(:show)}
  end

  context "for an admin" do

    let(:user) { Fabricate :user, admin: true}

    it {is_expected.to permit_action(:index)}
    it {is_expected.to permit_action(:new)}
    it {is_expected.to permit_action(:create)}
    it {is_expected.to permit_action(:show)}
  end
end
