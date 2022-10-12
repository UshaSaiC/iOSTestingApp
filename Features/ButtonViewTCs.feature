Feature: Button screen test cases

Scenario: Verify all elements are present in Button screen

Given I am on home screen of an app
When I click on Button
Then I should see a heading named Button
Then I should see first name text field
Then I should see last name text field
Then I should see get name button

Scenario: Verify get name functionality is working

Given I am on button screen of the app
When I enter first name in text field
When I enter last name in text field
When I click on get name button
Then I should see first name and last name displayed splitted with whitespace
