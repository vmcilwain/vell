require 'rails_helper'

describe BlogCommentPolicy do
  subject { BlogCommentPolicy.new(user, blog_comment) }
  let(:blog_comment) { Fabricate :blog_comment }

  context 'for a visitor' do
    it { should_not permitted_to(:index)  }
    it { should_not permitted_to(:update)  }
    it { should_not permitted_to(:edit)    }
    it { should_not permitted_to(:destroy)    }
  end

  context "for an admin" do
    let(:user) { Fabricate(:user, admin: true) }

    it { should permitted_to(:index)     }
    it { should permitted_to(:update)  }
    it { should permitted_to(:edit)    }
    it { should permitted_to(:destroy)    }
  end
end
