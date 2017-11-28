shared_examples 'requires sign in' do
  it 'redirects to sign in page' do
    sign_out user
    action
    expect(response).to redirect_to new_user_session_path
  end
end

shared_examples 'unauthorized user' do
  before do
    sign_out user
    sign_in Fabricate(:user, email: 'email@example.com')
    action
  end
  it 'redirects to root path' do
    expect(response).to redirect_to root_path
  end

  it "sets flash[:alert]" do
    expect(flash[:alert]).to_not be_nil
  end
end
