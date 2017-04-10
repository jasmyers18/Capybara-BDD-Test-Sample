# Tested using Firefox 47.0.1, selenium-webdriver (2.53.4), and Chrome 57.0.x
# Tests may not work if using a newer version of Firefox or Selenium-Webdriver

Feature: United Airlines Book Travel Form
  Scenario: Searching for a non-stop flight using specific depart and arrival dates
    Given I am on the united website

    When I enter the origin airport code "PDX"
    When I enter the destination airport code "LAX"
    When I enter a departing date "Dec 24, 2017"
    When I enter a returning date "Dec 25, 2017"
    When I specify the number of travelers
    When I add 3 adults
    When I select "Business or First" class
    When I indicate nonstop travel
    When I click the search button

    Then I should see a processing overlay
    Then I should see "PDX" as the departing airport
    Then I should see "LAX" as the arriving airport
    Then I should see "Dec 24, 2017" as the departing date

  Scenario: Searching for a flight without any travelers
    Given I am on the united website

    When I enter the origin airport code "PDX"
    When I enter the destination airport code "LAX"
    When I enter a departing date "Dec 24, 2017"
    When I enter a returning date "Dec 25, 2017"
    When I specify the number of travelers
    When I remove 1 adults
    When I click the search button

    Then I should see an error about not having any travelers