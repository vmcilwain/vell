require 'rails_helper'

describe BlogFilePolicy do
  subject { BlogFilePolicy.new(user, blog_file) }
  let(:blog_file) { Fabricate :blog_file }

  after { delete_files }

  context 'for a visitor' do
    it { should_not permitted_to(:index)  }
    it { should_not permitted_to(:new)  }
    it { should_not permitted_to(:create)  }
    it { should_not permitted_to(:update)    }
    it { should_not permitted_to(:destroy)    }
  end

  context "for an admin" do
    let(:user) { Fabricate(:user, admin: true) }

    it { should permitted_to(:index)     }
    it { should permitted_to(:new)  }
    it { should permitted_to(:create)    }
    it { should permitted_to(:update)    }
    it { should permitted_to(:destroy)    }
  end
end
