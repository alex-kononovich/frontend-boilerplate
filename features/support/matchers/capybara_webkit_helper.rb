RSpec::Matchers.define :have_console_message do |expected|
  match do |actual|
    result = false
    actual.driver.console_messages.each do |message_object|
      if message_object[:message].include? expected
        result = true
      end 
    end
    result
  end

  failure_message_for_should do |actual|
    "expected #{actual.driver.console_messages} to include message '#{expected}'"
  end

  failure_message_for_should_not do |actual|
    "expected #{actual.driver.console_messages} to not include message '#{expected}'"
  end
end
