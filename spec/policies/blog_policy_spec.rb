require 'rails_helper'

describe BlogPolicy do
  subject { BlogPolicy.new(user, blog) }
  let(:blog) { Fabricate :blog }

  context 'for a visitor' do
    it { should_not permitted_to(:new)  }
    it { should_not permitted_to(:create)  }
    it { should_not permitted_to(:edit)    }
    it { should_not permitted_to(:update)    }
    it { should_not permitted_to(:destroy)    }
  end

  context "for an admin" do
    let(:user) { Fabricate(:user, admin: true) }

    it { should permitted_to(:new)  }
    it { should permitted_to(:create)    }
    it { should permitted_to(:edit)    }
    it { should permitted_to(:update)    }
    it { should permitted_to(:destroy)    }
  end
end
