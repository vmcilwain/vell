class ApplicationMailer < ActionMailer::Base
  default to: 'Vell <vmcilwain@me.com>'
  default from: 'vell.herokuapp.com <vmcilwain@me.com>'
  helper :application
  layout 'mailer'
end
