# @author Lovell McIlwain
# Handles notification logic
class Notify < ApplicationMailer
  # Send email with contact me info
  #
  # @param contact_me [ContactMe] the created contact me
  def send_contact_me(contact_me)
    @contact_me = contact_me
    mail(to: contact_me.email, subject: "New Contact Me From #{contact_me.name}")
    mail(subject: "New Contact Me From #{contact_me.name}")
  end
  
  # Send email with blog comment info
  #
  # @param blog_comment [BlogComment] the created blog comment
  def send_new_blog_comment(blog_comment)
    @blog = blog_comment.blog
    @blog_comment = blog_comment
    mail(subject: "New Blog Comment: #{@blog.headline}")
  end
end
