def mailbox
  ActionMailer::Base.deliveries
end

def clear_mailbox
  ActionMailer::Base.deliveries.clear
end