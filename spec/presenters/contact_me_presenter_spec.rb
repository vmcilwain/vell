
require 'rails_helper'
#
describe ContactMePresenter do
  include_behavior

  let(:presenter) {ContactMePresenter.new(contact_me, view)}
  let(:contact_me) {Fabricate :contact_me}

  it 'returns name as a link' do
    expect(presenter.name_link).to eq link_to contact_me.name, contact_me
  end

  it "returns email as a link" do
    expect(presenter.email_link).to eq mail_to contact_me.email
  end

  it "returns a truncated body" do
    expect(presenter.truncated_body).to eq truncate(contact_me.body, length: 100) { link_to "Read More", contact_me }
  end

  it "returns short created at date" do
    expect(presenter.short_created_at).to eq contact_me.created_at.strftime("%Y-%m-%d")
  end

  it "returns destroy path as a button" do
    expect(presenter.delete_button).to eq link_to :Delete, contact_me, method: :delete, data: {confirm: "Are you sure?"}, class: 'btn btn-danger btn-xs'
  end
end
