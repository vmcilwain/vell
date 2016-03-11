shared_examples 'requires sign in' do
  it 'redirects to sign in page' do
    sign_out user
    action
    expect(response).to redirect_to new_user_session_path
  end
end
