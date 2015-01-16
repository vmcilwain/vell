class ApplicationMailer < ActionMailer::Base
  default from: "vextranet@herokuapp.com"
  default to: 'vmcilwain@me.com'
  layout 'mailer'
end
