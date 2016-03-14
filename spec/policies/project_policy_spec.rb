require 'rails_helper'

describe ProjectPolicy do
  subject { ProjectPolicy.new(user, project) }
  let(:project) { Fabricate :project }


  context 'for a visitor' do
    it { should_not permitted_to(:create)  }
    it { should_not permitted_to(:new)     }
    it { should_not permitted_to(:update)  }
    it { should_not permitted_to(:edit)    }
  end

  context "for an admin" do
    let(:user) { Fabricate(:user, admin: true) }

    it { should permitted_to(:create)  }
    it { should permitted_to(:new)     }
    it { should permitted_to(:update)  }
    it { should permitted_to(:edit)    }
  end
end
