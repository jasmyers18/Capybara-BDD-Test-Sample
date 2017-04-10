require 'capybara/cucumber'

Capybara.app_host="http://www.google.com"
Capybara.default_driver=:selenium
Capybara.default_selector = :xpath

# This makes it so the test is run on Chrome instead of Firefox.
# Comment out this section to run in Firefox. Obviously not the best solution but ok for demonstration purposes.
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

####GIVEN###
Given(/^I am on the united website$/) do
  visit('http://www.united.com')
end



####WHEN###
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

When(/^I enter a returning date "([^"]*)"$/) do |retDate|
  fill_in('ReturnDate',:with => retDate)
end

When(/^I specify the number of travelers/) do
  click_link("travelers-selector")
end

When(/^I add (\d+) adults$/) do |adults|
  # Had to convert adults to an int value using the .to_i
  for i in 1..adults.to_i
    #ugly xpath.
    find('//*[@id="travelers-select"]/div/ul/li[1]/div/a[2]').click
  end
end

When(/^I remove (\d+) adults$/) do |adults|
  for i in adults.to_i..1
    #ugly xpath.
    find('//*[@id="travelers-select"]/div/ul/li[1]/div/a[1]').click
  end
end

# The options for the cabinType will change based on whether the Award Travel is checked
When(/^I select "([^"]*)" class$/) do |cabinType|
  find('//*[@id="uniform-cabinType"]').click

  if(cabinType == "Business or First")
    find('//*[@id="cabinType"]/option[2]').select_option
  end

  if(cabinType == "Economy")
    find('//*[@id="cabinType"]/option[1]').select_option
  end
end

When(/^I indicate I want award travel$/) do
  find('//*[@id="uniform-AwardTravel"]').click
end

When(/^I indicate nonstop travel$/) do
  find('//*[@id="uniform-NonStopOnly"]').click
end

When(/^I click the search button$/) do
  click_button("flightBookingSubmit")
end


####THEN###
#Check for the overlay to be visible then hidden
Then(/^I should see a processing overlay$/) do
  find('//*[@id="fl-results-loader-full"]', visible: true).visible?
  find('//*[@id="fl-results-loader-full"]', visible: false).visible?
  sleep(3)
end

Then(/^I should see "([^"]*)" as the departing airport$/) do |orig|
  page.assert_selector(:xpath, './/*[@id="fl-search-segment-header-wrap"]/div[3]/h1/div[2]//*[contains(text(),"' + orig + '")]')
end

Then(/^I should see "([^"]*)" as the arriving airport$/) do |dest|
  page.assert_selector(:xpath, './/*[@id="fl-search-segment-header-wrap"]/div[3]/h1/div[4]//*[contains(text(),"' + dest + '")]')
end

Then(/^I should see "([^"]*)" as the departing date$/) do |deptDate|
  page.assert_selector(:xpath, './/*[@id="fl-search-segment-header-wrap"]/div[3]/h1/div[1]//*[contains(text(),"' + deptDate + '")]')
end

Then(/^I should see an error about not having any travelers$/) do
  page.assert_selector(:xpath, './/*[@id="main-content"]/div[1]/ul//*[contains(text(),"Please select the number of travelers.")]')
end