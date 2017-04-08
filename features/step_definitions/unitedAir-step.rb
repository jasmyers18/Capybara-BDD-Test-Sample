require 'capybara/cucumber'

Capybara.app_host="http://www.google.com"
Capybara.default_driver=:selenium
Capybara.default_selector = :xpath

# This makes it so the test is run on Chrome instead of Firefox.
# Comment out this section to run in Firefox. Obviously not the best solution but ok for demonstration purposes.
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Given(/^I am on the united website$/) do
  visit('http://www.united.com')
end




When(/^I enter the origin airport code "([^"]*)"$/) do |orig|
  fill_in('Origin',:with => orig)
end

When(/^I enter the destination airport code "([^"]*)"$/) do |dest|
  fill_in('Destination',:with => dest)
end

When(/^I indicate my dates are flexible$/) do
  # Tricky. Had to click the layer on top of the box instead of the box itself
  find('//*[@id="uniform-flexDate"]').click
end

When(/^I enter a departing date "([^"]*)"$/) do |depDate|
  fill_in('DepartDate',:with => depDate)
end

When(/^I enter a returning date$/) do
  pending
end

When(/^I specify the number of passengers$/) do
  pending
end

When(/^I specify the class$/) do
  pending
end

When(/^I indicate I want award travel$/) do
  pending
end

When(/^I indicate nonstop travel$/) do
  pending
end

When(/^I click the search button$/) do
  pending
end




Then(/^I should see the results$/) do
  page.has_css?('div#res li')
end

