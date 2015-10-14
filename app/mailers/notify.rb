class Notify < ApplicationMailer
  def send_contact_me(contact_me)
    @contact_me = contact_me
    mail(to: contact_me.email, subject: "New Contact Me From #{contact_me.name}")
    mail(subject: "New Contact Me From #{contact_me.name}")
  end
  
  def send_new_blog_comment(blog_comment)
    @blog = blog_comment.blog
    @blog_comment = blog_comment
    mail(subject: "New Blog Comment: #{@blog.headline}")
  end
end
