RSpec::Matchers.define :permitted_to do |action|
  match do |policy|
    policy.public_send("#{action}?")
  end
  
  # failure_message_for_should is deprecated
  failure_message do |policy|
    "#{policy.class} does not permit #{action} on #{policy.record} for #{policy.user.inspect}."
  end

  # failure_message_for_should_not is deprecated
  failure_message_when_negated do |policy|
    "#{policy.class} does not forbid #{action} on #{policy.record} for #{policy.user.inspect}."
  end
end
