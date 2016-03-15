require 'rails_helper'

describe ContactMePolicy do
  subject { ContactMePolicy.new(user, contact_me) }
  let(:contact_me) { Fabricate :contact_me }

  context 'for a visitor' do
    it { should_not permitted_to(:index)  }
    it { should_not permitted_to(:show)  }
  end

  context "for an admin" do
    let(:user) { Fabricate(:user, admin: true) }

    it { should permitted_to(:index)  }
    it { should permitted_to(:show)    }
  end
end
