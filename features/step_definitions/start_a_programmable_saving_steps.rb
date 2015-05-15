Given(/^I want to start a programmable saving$/) do
  @programmable_saving = ProgrammableSavings::Creator.create
end

Given(/^that a saver named "([^"]*)" exists$/) do |saver_name|
  Users::Creator.create(saver_name)
end

When(/^I add "([^"]*)" to the programmable saving with "([^"]*)" ticket$/) do |saver_name, ticket_count|
  ProgrammableSavings::AddSaver.new(@programmable_saving).add(saver_name, ticket_count)
end

When(/^the programmable saving starts on the next payday$/) do
  ProgrammableSavings::Launcher.new(@programmable_saving).start
end
