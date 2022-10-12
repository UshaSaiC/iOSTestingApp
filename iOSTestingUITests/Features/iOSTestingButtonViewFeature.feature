Feature: Button View
As a user, I should be able to tap on Button, enter first name and last name and get it displayed on UI

Scenario: Verify button view and get name displayed

Given App is Ready
When Clicked on Button
When entered First name and Last name
When clicked on Get Name Button and Closing Keypad
Then name is displayed
