# Tested using Firefox 47.0.1, selenium-webdriver (2.53.4), and Chrome 57.0.x
# Tests may not work if using a newer version of Firefox or Selenium-Webdriver

Feature: United Airlines Book Travel Form
  Scenario: Searching for a flight using specific depart and arrival dates
    Given I am on the united website

    When I enter the origin airport code "pdx"
    When I enter the destination airport code "lax"
#    When I indicate my dates are flexible
    When I enter a departing date "Dec 24, 2017"
    When I enter a returning date
    When I specify the number of passengers
    When I specify the class
    When I indicate I want award travel
    When I indicate nonstop travel
    When I click the search button

    Then I should see the results




    Scenario: Searching for a flight using specific depart and arrival dates
    Given I am on the united website

    When I enter the origin airport code "pdx"
    When I enter the destination airport code "lax"
    When I indicate my dates are flexible
#    When I enter a departing date "Dec 24, 2017"
#    When I enter a returning date
    When I specify the number of passengers
    When I specify the class
    When I indicate I want award travel
    When I indicate nonstop travel
    When I click the search button

    Then I should see the results
