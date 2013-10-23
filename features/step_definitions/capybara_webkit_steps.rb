Then(/^(?:|I )should see console message "(.*?)"$/) do |message|
  page.should have_console_message(message)
end
