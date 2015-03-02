class Notify < ApplicationMailer
  def send_contact_me(contact_me)
    @contact_me = contact_me
    mail(to: contact_me.email, subject: "New Contact Me From #{contact_me.name}")
  end
end
