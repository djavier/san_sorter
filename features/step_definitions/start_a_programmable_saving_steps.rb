Given(/^I want to start a programmable saving with a pool of (\d+)$/) do |pool_amount|
  @programmable_saving = ProgrammableSavings::Creator.create(pool_amount)
end

Given(/^that a saver named "([^"]*)" exists$/) do |saver_name|
  Users::Creator.create(saver_name)
end

When(/^"([^"]*)" joins to the programmable saving with (\d+) ticket$/) do |saver_name, ticket_count|
  ProgrammableSavings::Join.new(@programmable_saving).join(saver_name, ticket_count)
end

When(/^the programmable saving starts on the next payday$/) do
  @tickets = ProgrammableSavings::Launcher.new(@programmable_saving).start
end

Then(/^the tickets should state that:$/) do |table|
	table.map_headers! { |header| header.downcase.gsub(' ', '_').to_sym }
	expect(@tickets.to_h).to eql(table.hashes)
end
