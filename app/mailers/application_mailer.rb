class ApplicationMailer < ActionMailer::Base
  default to: 'Vell <vmcilwain@me.com>'
  default from: 'lovell.direct <vmcilwain@me.com>'
  helper :application
  layout 'mailer'
end
