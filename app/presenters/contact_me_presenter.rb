# @author Lovell McIlwain
#
# Presenter class for object views
class ContactMePresenter < BasePresenter
  # Reference initialized object_presenter as object
  presents :contact_me

  delegate :id, to: :contact_me
  delegate :body, to: :contact_me
  delegate :name, to: :contact_me

  # Return name as a link
  def name_link
    link_to contact_me.name, contact_me
  end

  # Return email as link
  def email_link
    mail_to contact_me.email
  end

  # Returns truncated body
  def truncated_body
    truncate(contact_me.body, length: 100) { link_to "Read More", contact_me }
  end

  # Returns medium created at
  def short_created_at
    short_date contact_me.created_at
  end

  # Returns destroy path as a button
  def delete_button
    link_to :Delete, contact_me, method: :delete, data: {confirm: "Are you sure?"}, class: 'btn btn-danger btn-xs'
  end
end
